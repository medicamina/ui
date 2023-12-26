import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_flutter/qr_flutter.dart';

// Medicamina
import 'package:medicamina_ui/states.dart';

class MedicaminaDashEdictsScriptsWidget extends StatefulWidget {
  const MedicaminaDashEdictsScriptsWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashEdictsScriptsWidget> createState() =>
      _MedicaminaDashEdictsScriptsWidgetState();
}

class _MedicaminaDashEdictsScriptsWidgetState
    extends State<MedicaminaDashEdictsScriptsWidget> {
  final eScripts = ['', ''];

  @override
  Widget build(BuildContext context) {
    Widget _getEScripts() {
      if (eScripts.isEmpty) {
        return const SizedBox(
          height: 110,
          child: Card(
            child: Center(
              child: Text(
                'No scripts available',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        );
      }
      return SizedBox(
        height: MediaQuery.of(context).size.width >= 700 ? 300 : 240,
        child: PageView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: 2,
          padEnds: false,
          controller: PageController(
              viewportFraction: MediaQuery.of(context).size.width >= 1000
                  ? 0.4
                  : MediaQuery.of(context).size.width >= 300
                      ? 0.6
                      : 0.8),
          itemBuilder: (context, index) {
            return const _EScriptsCarouselItem();
          },
        ),
      );
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
                      'E-scripts',
                      style: TextStyle(
                          fontWeight:
                              Modular.get<MedicaminaThemeState>().getDarkMode()
                                  ? FontWeight.normal
                                  : FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        _getEScripts(),
      ],
    );
  }
}

class _EScriptsCarouselItem extends StatefulWidget {
  const _EScriptsCarouselItem({Key? key}) : super(key: key);

  @override
  State<_EScriptsCarouselItem> createState() => __EScriptsCarouselItem();
}

class __EScriptsCarouselItem extends State<_EScriptsCarouselItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text('My title'),
                content: Text('This is my message.'),
                // actions: [
                //   ElevatedButton(onPressed: () => context., child: child),
                // ],
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 6, left: 6, right: 6),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QrImageView(
                gapless: false,
                data:
                    'https://www.digitalhealth.gov.au/initiatives-and-programs/electronic-prescriptions',
                version: QrVersions.auto,
                size: MediaQuery.of(context).size.width >= 700 ? 220 : 160,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text('Warfarin',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 3),
                    const Text('2 repeats left', textAlign: TextAlign.center),
                    const SizedBox(height: 3),
                    Wrap(
                      children: [
                        Text(
                          '12 days left of current script',
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
