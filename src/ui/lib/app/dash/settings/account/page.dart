import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/states.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicaminaDashSettingsAccountWidget extends StatefulWidget {
  const MedicaminaDashSettingsAccountWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashSettingsAccountWidget> createState() => _MedicaminaDashSettingsAccountWidget();
}

class _MedicaminaDashSettingsAccountWidget extends State<MedicaminaDashSettingsAccountWidget> {
  late bool _loading;
  late StreamSubscription _loadingStream;

  late String _firstName;
  late String _lateName;
  late String _middleName;
  late DateTime _birthday;

  @override
  void initState() {
    super.initState();
    _loading = Modular.get<MedicaminaAppBarLoadingState>().getLoading();
    _loadingStream = Modular.get<MedicaminaAppBarLoadingState>().getStream().listen((value) {
      setState(() {
        _loading = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _loadingStream.cancel();
  }

  Color getInputLabelColor() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return const Color.fromRGBO(240, 240, 240, 1);
    }
    return const Color.fromRGBO(103, 103, 103, 1);
  }

  TextStyle getInputLabelStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return TextStyle(color: getInputLabelColor(), fontWeight: FontWeight.normal, letterSpacing: 0.35);
    }
    return TextStyle(color: getInputLabelColor(), fontWeight: FontWeight.bold, letterSpacing: 0.35);
  }

  TextStyle getUploadPhotoTextStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return const TextStyle(fontWeight: FontWeight.normal);
    }
    return const TextStyle(fontWeight: FontWeight.w600);
  }

  TextStyle? getUploadPhotoSubtitleStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return TextStyle(color: Theme.of(context).textTheme.caption?.color);
    }
    return null;
  }

  TextStyle? getDividerLabelStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return Theme.of(context).textTheme.caption?.copyWith(
            fontSize: 13.66,
            fontWeight: FontWeight.normal,
          );
    }
    return Theme.of(context).textTheme.caption?.copyWith(
          fontSize: 13.66,
          fontWeight: FontWeight.bold,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 4),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'User profile picture',
                        style: getDividerLabelStyle(),
                      ),
                    ],
                  ),
                  Row(
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
                          Row(children: [Text('Upload profile photo', style: getUploadPhotoTextStyle())]),
                          const SizedBox(height: 6),
                          Row(children: [Text('Photo should be at least 300x300px', style: getUploadPhotoSubtitleStyle())]),
                          const SizedBox(height: 12),
                          Row(
                            children: [OutlinedButton(onPressed: () {}, child: Text('Upload a photo'))],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        'User information',
                        style: getDividerLabelStyle(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                'First name',
                                style: getInputLabelStyle(),
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                'Last name',
                                style: getInputLabelStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                // prefixIcon: Icon(Icons.edit),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                          const Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                // prefixIcon: Icon(Icons.edit),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                'Middle name',
                                style: getInputLabelStyle(),
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                'Birthdate',
                                style: getInputLabelStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                // prefixIcon: Icon(Icons.edit),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                          Expanded(
                            flex: 1,
                            child: DateTimePicker(
                              decoration: const InputDecoration(
                                hintText: 'MMM dd, YYYY',
                                prefixIcon: Icon(Icons.date_range),
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
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                'Birth town',
                                style: getInputLabelStyle(),
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                'Address',
                                style: getInputLabelStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                // prefixIcon: Icon(Icons.edit),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                          const Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                // prefixIcon: Icon(Icons.edit),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                    child: const Text(' CANCEL '),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      padding: const EdgeInsets.only(right: 14, left: 14),
                    ),
                    onPressed: _loading
                        ? null
                        : () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext _context) => AlertDialog(
                                title: const Text(
                                  'Discard changes?',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                content: const Text('If you chose to continue all changes will be reverted to the prevous configuration.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(_context, 'BACK'),
                                    child: const Text('BACK'),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(foregroundColor: Theme.of(context).buttonTheme.colorScheme?.surface),
                                    onPressed: () {
                                      Navigator.pop(_context, 'CONTINUE');
                                      // Beamer.of(context).beamToNamed(
                                      //   '/account',
                                      //   transitionDelegate: const NoAnimationTransitionDelegate(),
                                      // );
                                    },
                                    child: const Text(
                                      'CONTINUE',
                                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                const Padding(padding: EdgeInsets.only(right: 16)),
                ElevatedButton(
                  child: const Text(' SAVE '),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    textStyle: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1),
                    padding: const EdgeInsets.only(right: 18, left: 18),
                  ),
                  onPressed: Modular.get<MedicaminaAppBarLoadingState>().getLoading()
                      ? null
                      : () {
                          Modular.get<MedicaminaAppBarLoadingState>().setLoading(true);
                        },
                ),
                const Padding(padding: EdgeInsets.only(right: 14)),
              ],
            ),
          ],
        ));
  }
}
