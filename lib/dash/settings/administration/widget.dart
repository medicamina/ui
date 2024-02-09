import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/dash/settings/administration/create/widget.dart';
import 'package:medicamina_ui/dash/settings/administration/join/widget.dart';
import 'package:medicamina_ui/dash/settings/widget.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsClinicsWidget extends StatefulWidget {
  const MedicaminaDashSettingsClinicsWidget({super.key});

  @override
  State<MedicaminaDashSettingsClinicsWidget> createState() => _MedicaminaDashSettingsClinicsWidgetState();
}

class _MedicaminaDashSettingsClinicsWidgetState extends State<MedicaminaDashSettingsClinicsWidget> {
  var _owned = [];
  var _joined = [];
  var _pending = [];
  var _loading = true;
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/clinic' : 'http://localhost:8080/dash/settings/clinic';
    var response = await dio.get(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
        },
        validateStatus: (status) => true,
      ),
    );
    if (response.statusCode == 200) {
      var jsonObject = response.data;
      setState(() {
        _pending = jsonObject['pending'];
        _owned = jsonObject['owned'];
        _joined = jsonObject['joined'];
        _loading = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.data)));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return SizedBox(
        child: Center(child: CircularProgressIndicator()),
        height: 200.0,
        width: 200.0,
      );
    }
    return SettingsList(
      platform: DevicePlatform.iOS,
      darkTheme: const SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
      sections: [
        SettingsSection(
          title: Text('Clinic settings'),
          tiles: [
            SettingsTile.navigation(
              title: Text(
                'Create new clinic',
              ),
              leading: Icon(CupertinoIcons.plus_rectangle),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsClinicCreateWidget(), style: NavigationRouteStyle.material);
              },
            ),
            SettingsTile.navigation(
              title: Text('Join existing clinic'),
              leading: Icon(CupertinoIcons.signature),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsClinicJoinWidget(), style: NavigationRouteStyle.material);
              },
            ),
          ],
        ),
        PendingClinics(_pending),
        OwnedClinics(_owned),
        JoinedClinics(_joined),
        SettingsSection(
          margin: EdgeInsetsDirectional.only(top: 0),
          tiles: [
            CustomSettingsTile(
              child: Row(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back'),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PendingClinics extends AbstractSettingsSection {
  final List pending;
  const PendingClinics(this.pending, {super.key});

  @override
  Widget build(BuildContext context) {
    if (pending.isNotEmpty) {
      return SettingsSection(
        title: Text('Pending approval'),
        tiles: [
          for (var i in pending) SettingsTile.navigation(title: Text(i['name'])),
        ],
      );
    }
    return SizedBox.shrink();
  }
}

class OwnedClinics extends AbstractSettingsSection {
  final List owned;
  const OwnedClinics(this.owned, {super.key});

  @override
  Widget build(BuildContext context) {
    if (owned.isNotEmpty) {
      return SettingsSection(
        title: Text('Owned clinics'),
        tiles: [
          for (var i in owned) SettingsTile.navigation(title: Text(i['name'])),
        ],
      );
    }
    return SizedBox.shrink();
  }
}

class JoinedClinics extends AbstractSettingsSection {
  final List joined;
  const JoinedClinics(this.joined, {super.key});

  @override
  Widget build(BuildContext context) {
    if (joined.isNotEmpty) {
      return SettingsSection(
        title: Text('Joined clinics'),
        tiles: [
          for (var i in joined) SettingsTile.navigation(title: Text(i['name'])),
        ],
      );
    }
    return SizedBox.shrink();
  }
}
