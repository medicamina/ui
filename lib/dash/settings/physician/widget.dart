import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/dash/settings/physician/create/widget.dart';

import 'package:medicamina_ui/dash/settings/physician/view/widget.dart';
import 'package:medicamina_ui/dash/settings/widget.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsPhysicianWidget extends StatefulWidget {
  const MedicaminaDashSettingsPhysicianWidget({super.key});

  @override
  State<MedicaminaDashSettingsPhysicianWidget> createState() => _MedicaminaDashSettingsPhysicianWidgetState();
}

class _MedicaminaDashSettingsPhysicianWidgetState extends State<MedicaminaDashSettingsPhysicianWidget> {
  final dio = Dio();
  bool _loading = true;
  var physicianAccount;
  var pending = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      _loading = true;
    });
    try {
      const url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/physician/get' : 'http://localhost:8080/dash/settings/physician/get';
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization': await Modular.get<MedicaminaUserState>().getToken(),
          },
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200) {
        setState(() {
          physicianAccount = response.data['physicianAccount'];
          pending = response.data['pending'];
          _loading = false;
        });
      } else {
        print(response);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SettingsList(
      platform: DevicePlatform.iOS,
      darkTheme: const SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
      sections: [
        MedicaminaDashSettingsPhysicianCreateAccountWidget(physicianAccount: physicianAccount, pending: pending),
        MedicaminaDashSettingsPhysicanPendingWidget(
          pending: pending,
        ),
        MedicaminaDashSettingsPhysicianAccountWidget(
          physicainAccount: physicianAccount,
        ),
        MedicaminaDashSettingsPhysicianClinicsWidget(
          physicianAccount: physicianAccount
        ),

        SettingsSection(
          margin: EdgeInsetsDirectional.only(top: 0),
          tiles: [
            CustomSettingsTile(
              child: Row(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: physicianAccount == null ? OutlinedButton(
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back'),
                    ) : SizedBox.shrink(),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}


class MedicaminaDashSettingsPhysicianCreateAccountWidget extends AbstractSettingsSection {
  const MedicaminaDashSettingsPhysicianCreateAccountWidget({required this.physicianAccount, required this.pending, super.key});
  final physicianAccount;
  final pending;

  @override
  Widget build(BuildContext context) {
    if (physicianAccount == null) {
      if (pending.isEmpty) {
        return SettingsSection(
          title: Text('Physician account'),
          tiles: [
            SettingsTile.navigation(
              title: Text(
                'Create physician account',
              ),
              leading: Icon(CupertinoIcons.plus_rectangle),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsPhysicianCreateWidget(), style: NavigationRouteStyle.material);
              },
            ),
          ],
        );
      }
    }
    return SizedBox.shrink();
  }
}

class MedicaminaDashSettingsPhysicianAccountWidget extends AbstractSettingsSection {
  MedicaminaDashSettingsPhysicianAccountWidget({required this.physicainAccount, super.key});
  
  final physicainAccount;
  var hasRedirected = false;

  @override
  Widget build(BuildContext context) {
    if (physicainAccount != null && !hasRedirected) {
      hasRedirected = true;
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        navigateToEditScreen(context);
      });
    }
    return const SizedBox.shrink();
  }

  void navigateToEditScreen(BuildContext context) {
    Navigation.navigateTo(
      context: context,
      screen: MedicaminaDashSettingsPhysicianViewPhysicianWidget(physicianAccount: physicainAccount),
      style: NavigationRouteStyle.material,
    );
  }
}

class MedicaminaDashSettingsPhysicanPendingWidget extends AbstractSettingsSection {
  const MedicaminaDashSettingsPhysicanPendingWidget({required this.pending, super.key});
  final pending;

  @override
  Widget build(BuildContext context) {
    if (pending.isEmpty || pending == null) {
      return const SizedBox.shrink();
    }
    return SettingsSection(title: Text('Pending approval'), tiles: [
      SettingsTile(
        title: Text(pending[0]['name']),
      ),
    ]);
  }
}
