import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:medicamina/pages/dash/map/choropleth_map.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (900 > MediaQuery.of(context).size.width) {
      return mobile(context);
    }
    return desktop(context);
  }
}

Widget mobile(BuildContext context) {
  return const SingleChildScrollView(
    child: Text('Mobile'),
  );
}

Widget desktop(BuildContext context) {
  var email = supabase.auth.currentSession?.user.email;

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      child: Card(
        child: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
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
                        padding: EdgeInsets.only(left: 6),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(1000, 62),
                            // textStyle: TextStyle(color: Colors.white),
                            side: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          // style: ElevatedButton.styleFrom(
                          //   minimumSize: const Size(double.infinity, double.infinity), // <--- this line helped me
                          // ),
                          onPressed: () {},
                          child: Text('SECURITY AND LOGIN', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const Divider(indent: 6),
                      // const Padding(padding: EdgeInsets.only(top: 12)),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(
                indent: 6,
                endIndent: 6,
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    children: [Text("hello world")],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
