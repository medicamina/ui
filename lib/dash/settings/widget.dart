import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/dash/settings/administration/widget.dart';
import 'package:medicamina_ui/dash/settings/email/widget.dart';
import 'package:medicamina_ui/dash/settings/language/widget.dart';
import 'package:medicamina_ui/dash/settings/notifications/widget.dart';
import 'package:medicamina_ui/dash/settings/open-source-license/widget.dart';
import 'package:medicamina_ui/dash/settings/password/widget.dart';
import 'package:medicamina_ui/dash/settings/personal/widget.dart';
import 'package:medicamina_ui/dash/settings/phone-number/widget.dart';
import 'package:medicamina_ui/dash/settings/physician/widget.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsWidget extends StatefulWidget {
  const MedicaminaDashSettingsWidget({super.key});

  @override
  State<MedicaminaDashSettingsWidget> createState() => _MedicaminaDashSettingsWidgetState();
}

enum NavigationRouteStyle {
  cupertino,
  material,
}

class Navigation {
  static Future<T> navigateTo<T>({
    required BuildContext context,
    required Widget screen,
    required NavigationRouteStyle style,
    routeName
  }) async {
    Route? route;
    if (style == NavigationRouteStyle.cupertino) {
      route = CupertinoPageRoute<T>(builder: (_) => screen);
    } else if (style == NavigationRouteStyle.material) {
      route = MaterialPageRoute<T>(builder: (_) => screen, settings: RouteSettings(name: routeName != null ? routeName : screen.runtimeType.toString()));
    }

    return await Navigator.push<dynamic>(context, route!);
  }
}

class _MedicaminaDashSettingsWidgetState extends State<MedicaminaDashSettingsWidget> {
  bool _darkMode = Modular.get<MedicaminaThemeState>().getDarkMode();

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      platform: DevicePlatform.iOS,
      darkTheme: const SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
      sections: [
        SettingsSection(
          title: Text('General'),
          tiles: [
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('English'),
              onPressed: (context) {
                Navigation.navigateTo(
                  context: context,
                  screen: MedicaminaDashSettingsLanguageWidget(),
                  style: NavigationRouteStyle.material,
                );
              },
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  _darkMode = value;
                  Modular.get<MedicaminaThemeState>().setDarkMode(value);
                  Modular.get<MedicaminaThemeState>().changedState.broadcast();
                });
              },
              initialValue: _darkMode,
              leading: Icon(Icons.colorize),
              title: Text('Dark mode'),
              description: Text('App settings'),
            ),
            SettingsTile.navigation(
              title: Text('Personal details'),
              leading: Icon(CupertinoIcons.person),
              onPressed: (context) {
                Navigation.navigateTo(
                  context: context,
                  screen: MedicaminaDashSettingsPersonalWidget(),
                  style: NavigationRouteStyle.material,
                );
              },
            ),
            SettingsTile.navigation(
              title: Text('Email'),
              leading: Icon(CupertinoIcons.mail),
              onPressed: (context) {
                Navigation.navigateTo(
                  context: context,
                  screen: MedicaminaDashSettingsEmailWidget(),
                  style: NavigationRouteStyle.material,
                );
              },
            ),
            SettingsTile.navigation(
              title: Text('Phone number'),
              leading: Icon(CupertinoIcons.phone),
              onPressed: (context) {
                Navigation.navigateTo(
                  context: context,
                  screen: MedicaminaDashSettingsPhoneWidget(),
                  style: NavigationRouteStyle.material,
                );
              },
            ),
            SettingsTile.navigation(
              title: Text('Password'),
              leading: Icon(CupertinoIcons.padlock),
              onPressed: (context) {
                Navigation.navigateTo(
                  context: context,
                  screen: MedicaminaDashSettingsPasswordWidget(),
                  style: NavigationRouteStyle.material,
                );
              },
            ),
            SettingsTile.navigation(
              title: Text('Sign out'),
              leading: Icon(CupertinoIcons.person_badge_minus),
              description: Text('Edit account details'),
              onPressed: (context) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext _context) => AlertDialog(
                    title: const Text(
                      'Sign out?',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    content: const Text('Are you sure you want to sign out?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(_context),
                        child: const Text('NO'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).buttonTheme.colorScheme?.surface,
                        ),
                        onPressed: () {
                          Navigator.pop(_context, 'CONTINUE');
                          Modular.get<MedicaminaUserState>().logout();
                          Modular.to.navigate('/');
                        },
                        child: const Text(
                          'CONTINUE',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SettingsTile.navigation(
              title: Text('Physician account'),
              leading: Icon(CupertinoIcons.heart),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsPhysicianWidget(), style: NavigationRouteStyle.material, routeName: 'home');
              },
            ),
            SettingsTile.navigation(
              title: Text('Administration'),
              leading: Icon(CupertinoIcons.house_alt),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsClinicsWidget(), style: NavigationRouteStyle.material);
              },
            ),
            SettingsTile.navigation(
              title: Text('Switch mode'),
              leading: Icon(CupertinoIcons.arrow_2_circlepath),
              onPressed: (context) {},
            ),
            SettingsTile.navigation(
              title: Text('Billing'),
              leading: Icon(CupertinoIcons.money_dollar),
              description: Text('Clinic settings'),
              onPressed: (context) {},
            ),
            SettingsTile.navigation(
              title: Text('Notifications'),
              leading: Icon(CupertinoIcons.bell),
              description: Text('Notifications'),
              onPressed: (context) {
                Navigation.navigateTo(
                  context: context,
                  screen: MedicaminaDashSettingsNotificationsWidget(),
                  style: NavigationRouteStyle.material,
                );
              },
            ),
          ],
        ),
        SettingsSection(
          title: Text('Misc'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.description),
              title: Text('Terms of Service'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.collections_bookmark),
              title: Text('Open source license'),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsOpenSourceLicenseWidget(), style: NavigationRouteStyle.material);
              },
            ),
          ],
        ),
      ],
    );
  }
}
