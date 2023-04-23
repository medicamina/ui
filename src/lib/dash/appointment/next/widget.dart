import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/states.dart';

class MedicaminaDashAppointmentNextWidget extends StatefulWidget {
  const MedicaminaDashAppointmentNextWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashAppointmentNextWidget> createState() => _MedicaminaDashAppointmentNextWidgetState();
}

class _MedicaminaDashAppointmentNextWidgetState extends State<MedicaminaDashAppointmentNextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next appointment',
                      style: TextStyle(fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.close),
                      tooltip: 'Cancel appointment',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width >= 500
              ? 128
              : MediaQuery.of(context).size.width >= 300
                  ? 140
                  : 160,
          child: Card(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            '4th September',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 26, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Dr Al E Gator',
                            style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12, top: 6),
                          child: Text(
                            '11 AM',
                            style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12, top: 6),
                          child: Text(
                            '123 Health Nut lane',
                            style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width >= 500
                                  ? 8
                                  : MediaQuery.of(context).size.width >= 300
                                      ? 20
                                      : 44,
                              right: MediaQuery.of(context).size.width >= 300 ? 22 : 2),
                          child: SizedBox.fromSize(
                            size: const Size(84, 84),
                            child: ClipOval(
                              child: Material(
                                color: Theme.of(context).hoverColor.withAlpha(15),
                                child: InkWell(
                                  radius: 84,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.map,
                                        size: 44,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width >= 500
              ? 128
              : MediaQuery.of(context).size.width >= 300
                  ? 134
                  : 160,
          child: Card(
            color: Theme.of(context).colorScheme.primary.withAlpha(160),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            elevation: 0,
            child: InkWell( // ????????????? SHOULD THE CARD BE AN INKWELL TO CANCEL THE APPOINTMENT?
              child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            '20th November',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 26, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Friendly pathology',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12, top: 6),
                          child: Text(
                            '1 PM',
                            style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12, top: 6),
                          child: Text(
                            '116 Health Nut lane',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width >= 500
                                  ? 8
                                  : MediaQuery.of(context).size.width >= 300
                                      ? 20
                                      : 44,
                              right: MediaQuery.of(context).size.width >= 300 ? 22 : 2),
                          child: SizedBox.fromSize(
                            size: const Size(84, 84),
                            child: ClipOval(
                              child: Material(
                                color: Theme.of(context).hoverColor.withAlpha(15),
                                child: InkWell(
                                  radius: 84,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.map,
                                        size: 44,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ),
          ),
        ),
      ],
    );
  }
}
