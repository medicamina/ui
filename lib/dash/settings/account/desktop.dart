import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:date_time_picker/date_time_picker.dart';

// Medicamina
import 'package:medicamina/states.dart';

class MedicaminaDashSettingsAccountDesktopWidget extends StatefulWidget {
  const MedicaminaDashSettingsAccountDesktopWidget({Key? key})
      : super(key: key);

  @override
  State<MedicaminaDashSettingsAccountDesktopWidget> createState() =>
      _MedicaminaDashSettingsAccountDesktopWidget();
}

class _MedicaminaDashSettingsAccountDesktopWidget
    extends State<MedicaminaDashSettingsAccountDesktopWidget> {
  late String _firstName;
  late String _lateName;
  late String _middleName;
  late DateTime _birthday;
  late bool _marketing = false;
  late bool _darkMode = false;

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

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

  TextStyle getUploadPhotoTextStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return const TextStyle(fontWeight: FontWeight.normal);
    }
    return const TextStyle(fontWeight: FontWeight.w600);
  }

  TextStyle? getUploadPhotoSubtitleStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return TextStyle(color: Theme.of(context).textTheme.bodySmall?.color);
    }
    return null;
  }

  TextStyle? getDividerLabelStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 13.66,
            fontWeight: FontWeight.normal,
          );
    }
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 13.66,
          fontWeight: FontWeight.bold,
        );
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
            Text('Profile', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            const Divider(height: 1),
            const SizedBox(height: 6),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'User profile picture',
                    style: getDividerLabelStyle(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.account_box,
                            size: 140,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text('Upload profile photo',
                                style: getUploadPhotoTextStyle())
                          ]),
                          const SizedBox(height: 6),
                          Row(children: [
                            Text('Photo should be at least 300x300px',
                                style: getUploadPhotoSubtitleStyle())
                          ]),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              OutlinedButton(
                                  onPressed: () {},
                                  child: const Text('Upload a photo'))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'User information',
                    style: getDividerLabelStyle(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
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
                          'First name',
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
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                                CommunityMaterialIcons.alphabetical_variant),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 2, child: Container()),
              ],
            ),
            const SizedBox(height: 6),
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
                          'Middle name',
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
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                                CommunityMaterialIcons.alphabetical_variant),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 2, child: Container()),
              ],
            ),
            const SizedBox(height: 6),
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
                          'Last name',
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
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                                CommunityMaterialIcons.alphabetical_variant),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 2, child: Container()),
              ],
            ),
            const SizedBox(height: 6),
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
                          'Birthdate',
                          style: getInputLabelStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: DateTimePicker(
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: 9, bottom: 0, left: 10),
                            hintText: 'MMM dd, YYYY',
                            suffixIcon: Icon(Icons.date_range),
                            border: OutlineInputBorder(),
                          ),
                          initialValue: '',
                          firstDate: DateTime(1910),
                          useRootNavigator: true,
                          lastDate: DateTime.now(),
                          dateLabelText: 'Date',
                          onChanged: (val) => print(val),
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (val) => print(val),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 2, child: Container()),
              ],
            ),
            const SizedBox(height: 6),
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
                          'Birthtown',
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
                          decoration: InputDecoration(
                            suffixIcon: Icon(CommunityMaterialIcons.map_marker),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 2, child: Container()),
              ],
            ),
            const SizedBox(height: 6),
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
                          'Phone number',
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixIcon: Icon(CommunityMaterialIcons.cellphone),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 2, child: Container()),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'User preferences',
                    style: getDividerLabelStyle(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
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
                          'Receive marketing emails',
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
                          value: _marketing,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            setState(() {
                              _marketing = value;
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
            const SizedBox(height: 6),
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
                          'Force dark mode',
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
                          value: _darkMode,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            setState(() {
                              _darkMode = value;
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
            const SizedBox(height: 6),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
