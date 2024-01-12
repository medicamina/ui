import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaDashSettingsDesktopWidget extends StatefulWidget {
  const MedicaminaDashSettingsDesktopWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashSettingsDesktopWidget> createState() => _MedicaminaDashSettingsDesktopWidgetState();
}

class _MedicaminaDashSettingsDesktopWidgetState extends State<MedicaminaDashSettingsDesktopWidget> {
  late String _uri;
  late bool _loading;

  void setUri() {
    setState(() {
      _uri = Modular.args.uri.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    setUri();
    Modular.to.addListener(setUri);
    setState(() {
      _loading = false;
    });
    // _loading = Modular.get<MedicaminaAppBarLoadingState>().getLoading();
    // _loadingStream = Modular.get<MedicaminaAppBarLoadingState>().getStream().listen((value) {
    //   setState(() {
    //     _loading = value;
    //   });
    // });
  }

  @override
  void dispose() {
    super.dispose();
    Modular.to.removeListener(setUri);
  }

  Border? getActiveBorderStyle(uri) {
    if (uri == _uri) {
      return Border(left: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 1.5));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 6),
          child: Center(
            child: SizedBox(
              width: 980,
              height: 675,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 230,
                            child: Column(
                              children: [
                                const Padding(padding: EdgeInsets.only(top: 12)),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(88),
                                    child: Image.asset(
                                      'assets/images/jake_selfie.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.only(top: 12)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12, right: 12),
                                  child: Text(
                                    // email != null ? email.toString() : '',
                                    '',
                                    style: Theme.of(context).textTheme.subtitle1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 0),
                          ListTile(
                            title: const Text('Account'),
                            shape: getActiveBorderStyle('/dash/settings/account'),
                            enabled: _uri != '/dash/settings/account',
                            onTap: () {
                              Modular.to.navigate('./account');
                            },
                          ),
                          ListTile(
                            title: const Text('Security'),
                            shape: getActiveBorderStyle('/dash/settings/security'),
                            enabled: _uri != '/dash/settings/security',
                            onTap: () {
                              Modular.to.navigate('./security');
                            },
                          ),
                          ListTile(
                            title: const Text('Billing'),
                            shape: getActiveBorderStyle('/dash/settings/billing'),
                            enabled: _uri != '/dash/settings/billing',
                            onTap: () {
                              Modular.to.navigate('./billing');
                            },
                          ),
                          ListTile(
                            title: const Text('Switch to Doctor View'),
                            shape: getActiveBorderStyle('/dash/settings/doctor'),
                            enabled: _uri != '/dash/settings/doctor',
                            onTap: () {
                              Modular.to.navigate('/clinic/appointments');
                            },
                          ),
                          ListTile(
                            tileColor: Colors.red.shade300.withAlpha(20),
                            title: const Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            onTap: () async {
                              Modular.get<MedicaminaUserState>().logout();
                              Modular.to.navigate('/');
                            },
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextButton(
                                  child: const Text('CANCEL'),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.red,
                                    backgroundColor: Colors.red.shade300.withAlpha(20),
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
                                        },
                                ),
                                const SizedBox(height: 4),
                                ElevatedButton(
                                  child: const Text('SUBMIT'),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    textStyle: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1),
                                    padding: const EdgeInsets.only(right: 18, left: 18),
                                  ),
                                  onPressed: () => null,
                                  // onPressed: Modular.get<MedicaminaAppBarLoadingState>().getLoading()
                                  //     ? null
                                  //     : () {
                                  //         Modular.get<MedicaminaAppBarLoadingState>().setLoading(true);
                                  //       },
                                ),
                                const Padding(padding: EdgeInsets.only(right: 14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(thickness: 0.66, width: 0),
                    const Expanded(flex: 3, child: RouterOutlet()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}