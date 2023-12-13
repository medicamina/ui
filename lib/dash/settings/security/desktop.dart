import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina_ui/states.dart';

class MedicaminaDashSettingsSecurityDesktopWidget extends StatefulWidget {
  const MedicaminaDashSettingsSecurityDesktopWidget({Key? key})
      : super(key: key);

  @override
  State<MedicaminaDashSettingsSecurityDesktopWidget> createState() =>
      _MedicaminaDashSettingsSecurityDesktopWidget();
}

class _MedicaminaDashSettingsSecurityDesktopWidget
    extends State<MedicaminaDashSettingsSecurityDesktopWidget> {
  late bool _emailOnly = false;
  late bool _smsVerify = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TextStyle? getDividerLabelStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return Theme.of(context)
          .textTheme
          .caption
          ?.copyWith(fontSize: 13.66, fontWeight: FontWeight.normal);
    }
    return Theme.of(context)
        .textTheme
        .caption
        ?.copyWith(fontSize: 13.66, fontWeight: FontWeight.bold);
  }

  Color getInputLabelColor() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return const Color.fromRGBO(240, 240, 240, 1);
    }
    return const Color.fromRGBO(103, 103, 103, 1);
  }

  TextStyle getInputLabelStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return TextStyle(color: getInputLabelColor(), letterSpacing: 0.35);
    }
    return TextStyle(color: getInputLabelColor(), letterSpacing: 0.35);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Security', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 4),
            const Divider(height: 1),
            const SizedBox(height: 8),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'Change password',
                    style: getDividerLabelStyle(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Text(
                          'Old password',
                          style: getInputLabelStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 40,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                                CommunityMaterialIcons.form_textbox_password),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Text(
                          'New password',
                          style: getInputLabelStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 40,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                                CommunityMaterialIcons.form_textbox_password),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Text(
                          'Confirm new password',
                          style: getInputLabelStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 40,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                                CommunityMaterialIcons.form_textbox_password),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'Change email address',
                    style: getDividerLabelStyle(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Text(
                          'New email address',
                          style: getInputLabelStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 40,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: Icon(CommunityMaterialIcons.at),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Text(
                          'Confirm new email address',
                          style: getInputLabelStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 40,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: Icon(CommunityMaterialIcons.at),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'Sign-in settings',
                    style: getDividerLabelStyle(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Text(
                          'Disable password',
                          style: getInputLabelStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Switch(
                          value: _emailOnly,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            setState(() {
                              _emailOnly = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Text(
                          'SMS verify authentication',
                          style: getInputLabelStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Switch(
                          value: _smsVerify,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            setState(() {
                              _smsVerify = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
