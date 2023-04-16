import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Medicamina
import 'package:medicamina/states.dart';

class MedicaminaDashEdictsReportsWidget extends StatelessWidget {
  const MedicaminaDashEdictsReportsWidget({Key? key}) : super(key: key);

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
                      'Recent doctor reports',
                      style: TextStyle(fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      tooltip: 'Previous reports',
                      icon: const Icon(Icons.library_books_outlined),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: Card(
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
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                          child: SvgPicture.asset(
                            'assets/images/doctor-icon.svg',
                            color: Modular.get<MedicaminaThemeState>().getDarkMode() ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const Spacer(flex: 2),
                        Text(
                          'Dr. Hugh Mungus',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge?.apply(fontWeightDelta: 1),
                        ),
                        const SizedBox(height: 3),
                        Text('Prescription update', textAlign: TextAlign.center, style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 16)),
                        const SizedBox(height: 3),
                        const Text('2mg Pencilin once daily 8am', textAlign: TextAlign.center),
                        const Spacer(flex: 3),
                        Text('Two months ago', textAlign: TextAlign.center, style: Theme.of(context).textTheme.caption)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
