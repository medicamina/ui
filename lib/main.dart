import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:health/health.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:workmanager/workmanager.dart';
import 'package:googleapis/fitness/v1.dart' as fitness;
import 'package:background_fetch/background_fetch.dart';

// Medicamina
import 'package:medicamina_ui/module.dart';
import 'package:medicamina_ui/widget.dart';
import 'package:medicamina_ui/firebase_options.dart';

/// Background fetch task for Apple Health (iOS)
void backgroundFetchHeadlessTask(String taskId) async {
  final health = HealthFactory();

  // Define the data type to fetch (steps)
  var types = [
    HealthDataType.STEPS,
    HealthDataType.WEIGHT,
    HealthDataType.HEIGHT,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.HEART_RATE,
    HealthDataType.BODY_TEMPERATURE,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.WATER,
    HealthDataType.SLEEP_IN_BED,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_REM,
  ];

  // requesting access to the data types before reading them
  bool requested = await health.requestAuthorization(types);

  // Fetch data from midnight until now
  DateTime midnight = DateTime.now();
  midnight = DateTime(midnight.year, midnight.month, midnight.day);

  List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
    midnight,
    DateTime.now(),
    types,
  );

  // Process and log the fetched steps
  healthData.forEach((point) {
    print('Background steps: ${point.value}');
  });

  // Finish the background fetch task
  BackgroundFetch.finish(taskId);
}

/// Callback dispatcher for WorkManager (Google Fit - Android)
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Fetch Google Fit steps in the background
    fetchGoogleFitSteps();
    return Future.value(true);
  });
}

/// Fetch Google Fit Steps (Android)
void fetchGoogleFitSteps() async {
  const _scopes = ['https://www.googleapis.com/auth/fitness.activity.read'];

  // Authenticate with Google using OAuth
  var client = await clientViaUserConsent(
    ClientId('YOUR_CLIENT_ID', ''), // Replace with your client ID
    _scopes,
    (url) {
      print('Please go to the following URL and grant access: $url');
    },
  );

  var fitnessApi = fitness.FitnessApi(client);

  // Build the aggregate request
  var request = _buildAggregateRequest();

  // Call Google Fit API and handle response
  try {
    var response = await fitnessApi.users.dataset.aggregate(request, 'me');
    print("Google Fit step data response: $response");
  } catch (error) {
    print("Error fetching Google Fit step data: $error");
  }
}

/// Build the aggregate request for Google Fit (Android)
fitness.AggregateRequest _buildAggregateRequest() {
  // Get today's date at midnight
  DateTime midnight = DateTime.now();
  midnight = DateTime(midnight.year, midnight.month, midnight.day);

  return fitness.AggregateRequest.fromJson({
    "aggregateBy": [
      {
        "dataTypeName": "com.google.step_count.delta",
      }
    ],
    "bucketByTime": {
      "durationMillis": 86400000, // Group by day (24 hours)
    },
    "startTimeMillis": midnight.millisecondsSinceEpoch, // Start from midnight
    "endTimeMillis": DateTime.now().millisecondsSinceEpoch, // End at the current time
  });
}

/// Main entry point of the application
Future<void> main() async {
  // Initialize Flutter and plugins
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setPathUrlStrategy();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set system UI overlays
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );

  if (Platform.isAndroid) {
    // Initialize WorkManager for Google Fit (Android)
    Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    Workmanager().registerPeriodicTask(
      "1", // Unique task name
      "fetchGoogleFitSteps", // Task name
      frequency: Duration(minutes: 15), // Run every 15 minutes
    );
  }

  if (Platform.isIOS) {
    // Initialize Background Fetch for iOS
    BackgroundFetch.configure(
        BackgroundFetchConfig(
          minimumFetchInterval: 15, // Fetch every 15 minutes
          stopOnTerminate: false, // Continue in background even after termination
          enableHeadless: true, // Allow headless execution
        ), (String taskId) async {
      // Handle background fetch trigger (iOS)
      backgroundFetchHeadlessTask(taskId);
    }, (String taskId) async {
      print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
      BackgroundFetch.finish(taskId);
    }).then((int status) {
      print('[BackgroundFetch] configure success: $status');
    }).catchError((e) {
      print('[BackgroundFetch] configure ERROR: $e');
    });

    // Register background fetch headless task (iOS)
    BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  }
  // Run the app
  runApp(getApp());
}

Widget getApp() {
  if (Platform.isIOS || Platform.isAndroid) {
    return ModularApp(
      module: MedicaminaAppModule(),
      child: const MedicaminaAppWidget(),
    );
  }
  return DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => ModularApp(
      module: MedicaminaAppModule(),
      child: const MedicaminaAppWidget(),
    ),
  );
}
