import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:medicamina_ui/states.dart';
import 'package:intl/intl.dart';

class MedicaminaAppointment {
  late final DateTime date;
  late final String drName;
  late final String address;
  late bool newest = false;

  MedicaminaAppointment(
      {required this.date, required this.drName, required this.address});

  setNewest(bool isNewest) {
    newest = isNewest;
  }

  getNewest() {
    return newest;
  }

  getDate() {
    String suffix = 'th';
    final int digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = <String>['st', 'nd', 'rd'][digit - 1];
    }
    return DateFormat("E, MMM d'$suffix' yyyy").format(date);
  }
}

class MedicaminaDashAppointmentNextWidget extends StatefulWidget {
  const MedicaminaDashAppointmentNextWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashAppointmentNextWidget> createState() =>
      _MedicaminaDashAppointmentNextWidgetState();
}

class _MedicaminaDashAppointmentNextWidgetState
    extends State<MedicaminaDashAppointmentNextWidget> {
  List<MedicaminaAppointment> appointments = [
    MedicaminaAppointment(
        date: DateTime(2022, 6, 26, 10, 30, 0, 0, 0),
        drName: 'Dr Al E Gator',
        address: '123 Health Nut Lane, Sydney'),
    MedicaminaAppointment(
        date: DateTime(2021, 1, 14, 16, 15, 0, 0, 0),
        drName: 'Friendly Pathology',
        address: '116 Hospital Avenue, Paramatta'),
    MedicaminaAppointment(
        date: DateTime(2023, 9, 12, 11, 45, 0, 0, 0),
        drName: 'Dr Hugh Mungus',
        address: 'Via TeleHealth'),
  ];

  @override
  Widget build(BuildContext context) {
    if (appointments.isNotEmpty) {
      MedicaminaAppointment element =
          MedicaminaAppointment(address: '1', date: DateTime(3000), drName: '');
      for (var i in appointments) {
        var isNewer = i.date.compareTo(element.date);
        if (isNewer <= -1) {
          element = i;
        }
      }
      appointments[appointments.indexOf(element)].setNewest(true);
    }

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
                      'Appointments',
                      style: TextStyle(
                        fontWeight:
                            Modular.get<MedicaminaThemeState>().getDarkMode()
                                ? FontWeight.normal
                                : FontWeight.bold,
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
                    IconButton(
                      onPressed: () {
                        Modular.to.navigate('appointment/booking');
                      },
                      icon: const Icon(Icons.add_circle_outline),
                      tooltip: 'New appointment',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        for (var i in appointments) _MedicaminaDashAppointmentWidget(i)
      ],
    );
  }
}

class _MedicaminaDashAppointmentWidget extends StatelessWidget {
  MedicaminaAppointment _MedicaminaAppointment;

  _MedicaminaDashAppointmentWidget(this._MedicaminaAppointment);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width >= 500
          ? 128
          : MediaQuery.of(context).size.width >= 300
              ? 140
              : 160,
      child: Card(
        color: _MedicaminaAppointment.getNewest()
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withAlpha(130),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        _MedicaminaAppointment.getDate(),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 26, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        _MedicaminaAppointment.drName,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 6),
                      child: Text(
                        '11 AM',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 6),
                      child: Text(
                        _MedicaminaAppointment.address,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tooltip(
                      verticalOffset: 34,
                      message: 'Get directions',
                      child: SizedBox.fromSize(
                        size: const Size(84, 84),
                        child: ClipOval(
                          child: Material(
                            color: Theme.of(context).hoverColor.withAlpha(15),
                            child: InkWell(
                              radius: 84,
                              onTap: () async {
                                String address = Uri.encodeComponent(
                                    _MedicaminaAppointment.address);
                                var googleUrl = Uri(
                                    scheme: 'https',
                                    host: 'www.google.com',
                                    path: '/maps/search/$address');
                                if (await canLaunchUrl(googleUrl)) {
                                  await launchUrl(googleUrl);
                                } else {
                                  throw 'Could not open the map.';
                                }
                              },
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
              SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        tooltip: 'Cancel',
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white70,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
