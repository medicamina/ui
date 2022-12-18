import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget? widget;
    if (900 > MediaQuery.of(context).size.width) {
      widget = mobile(context);
    } else {
      widget = desktop(context);
    }

    return Scaffold(backgroundColor: Colors.white, body: widget);
  }
}

Widget mobile(BuildContext context) {
  return const SingleChildScrollView(
    child: Text('Mobile'),
  );
}

Widget desktop(BuildContext context) {
  var email = supabase.auth.currentSession?.user.email;
  final _beamerButtonNavigationKey = GlobalKey<BeamerState>();

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      child: Card(
        child: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 18)),
                    const Center(
                      child: Icon(
                        Icons.account_box,
                        size: 140,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12)),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Text(
                        email != null ? email.toString() : '',
                        style: Theme.of(context).textTheme.subtitle1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12)),
                    const Divider(indent: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(1000, 62),
                          side: const BorderSide(
                            color: Colors.transparent,
                          ),
                          backgroundColor: Beamer.of(context).currentBeamLocation.history.last.routeInformation.location == '/account' ? Theme.of(context).colorScheme.primary.withOpacity(0.12) : Colors.white,
                        ),
                        onPressed: () {
                          Beamer.of(context).beamToNamed(
                            '/account',
                            transitionDelegate: const NoAnimationTransitionDelegate(),
                          );
                        },
                        child: const Text(
                          'OVERVIEW',
                          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.75),
                        ),
                      ),
                    ),
                    const Divider(indent: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(1000, 62),
                          side: const BorderSide(
                            color: Colors.transparent,
                          ),
                          backgroundColor: Beamer.of(context).currentBeamLocation.history.last.routeInformation.location == '/security' ? Theme.of(context).colorScheme.primary.withOpacity(0.12) : Colors.white,
                        ),
                        onPressed: () {
                          Beamer.of(context).beamToNamed(
                            '/security',
                            transitionDelegate: const NoAnimationTransitionDelegate(),
                          );
                        },
                        child: const Text(
                          'SECURITY',
                          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.75),
                        ),
                      ),
                    ),
                    const Divider(indent: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(1000, 62),
                          side: const BorderSide(
                            color: Colors.transparent,
                          ),
                          backgroundColor: Beamer.of(context).currentBeamLocation.history.last.routeInformation.location == '/subscription' ? Theme.of(context).colorScheme.primary.withOpacity(0.12) : Colors.white,
                        ),
                        onPressed: () {
                          Beamer.of(context).beamToNamed(
                            '/subscription',
                            transitionDelegate: const NoAnimationTransitionDelegate(),
                          );
                        },
                        child: const Text(
                          'SUBSCRIPTION',
                          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.75),
                        ),
                      ),
                    ),
                    const Divider(indent: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(1000, 62),
                          side: const BorderSide(
                            color: Colors.transparent,
                          ),
                          backgroundColor: Beamer.of(context).currentBeamLocation.history.last.routeInformation.location == '/profile' ? Theme.of(context).colorScheme.primary.withOpacity(0.12) : Colors.white,
                        ),
                        onPressed: () {
                          Beamer.of(context).beamToNamed(
                            '/profile',
                            transitionDelegate: const NoAnimationTransitionDelegate(),
                          );
                        },
                        child: const Text(
                          'PERSONAL DETAILS',
                          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.75),
                        ),
                      ),
                    ),
                    const Divider(indent: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(1000, 62),
                          side: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        onPressed: () async => showDialog<String>(
                          context: context,
                          builder: (BuildContext _context) => AlertDialog(
                            title: const Text(
                              'Logout?',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            content: const Text('Are you sure you want to logout?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(_context, 'BACK'),
                                child: const Text('BACK'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(_context, 'CONTINUE');
                                  await supabase.auth.signOut();
                                  Beamer.of(context, root: true).beamToReplacementNamed(
                                    '/',
                                    transitionDelegate: const NoAnimationTransitionDelegate(),
                                  );
                                },
                                child: const Text(
                                  'CONTINUE',
                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        child: const Text(
                          'logout',
                          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.75, color: Colors.red),
                        ),
                      ),
                    ),
                    const Divider(indent: 6),
                  ],
                ),
              ),
              // RIGHT SCREEN
              const VerticalDivider(
                indent: 6,
                endIndent: 6,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Expanded(
                      child: Beamer(
                        key: _beamerButtonNavigationKey,
                        routerDelegate: BeamerDelegate(
                          setBrowserTabTitle: false,
                          initialPath: '/account',
                          locationBuilder: RoutesLocationBuilder(
                            routes: {
                              '/account': (p0, p1, p2) => const Text('Account'),
                              '/security': (p0, p1, p2) => const Text('Security'),
                              '/subscription': (p0, p1, p2) => const Text('Subscription'),
                              '/profile': (p0, p1, p2) => const Text('Profile'),
                            },
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text(' CANCEL '),
                          style: TextButton.styleFrom(
                            primary: Colors.red,
                            padding: const EdgeInsets.only(right: 14, left: 14),
                          ),
                          onPressed: () => showDialog<String>(
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
                                  onPressed: () {
                                    Navigator.pop(_context, 'CONTINUE');
                                    Beamer.of(context).beamToNamed(
                                      '/account',
                                      transitionDelegate: const NoAnimationTransitionDelegate(),
                                    );
                                  },
                                  child: const Text(
                                    'CONTINUE',
                                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 16)),
                        ElevatedButton(
                          child: const Text(' SAVE '),
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1),
                            padding: const EdgeInsets.only(right: 18, left: 18),
                          ),
                          onPressed: () {},
                        ),
                        const Padding(padding: EdgeInsets.only(right: 14)),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
