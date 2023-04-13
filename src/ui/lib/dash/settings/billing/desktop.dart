import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/states.dart';

class MedicaminaDashSettingsBillingDesktopWidget extends StatefulWidget {
  const MedicaminaDashSettingsBillingDesktopWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashSettingsBillingDesktopWidget> createState() => _MedicaminaDashSettingsBillingDesktopWidget();
}

class _MedicaminaDashSettingsBillingDesktopWidget extends State<MedicaminaDashSettingsBillingDesktopWidget> {
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
            Text('Billing', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 4),
            const Divider(height: 1),
            const SizedBox(height: 4),
            Theme(
              data: Theme.of(context).copyWith(
                cardTheme: CardTheme(
                  elevation: 0,
                  color: Theme.of(context).hoverColor,
                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
                  margin: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 6,
                    bottom: 6,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current monthly bill',
                              style: TextStyle(
                                color: Modular.get<MedicaminaThemeState>().getDarkMode() ? null : const Color.fromRGBO(87, 96, 106, 1),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.4,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text('\$0', style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 20),
                            TextButton(onPressed: () {}, child: const Text('Switch to yearly billing')),
                            // Text('Switch to yearly billing', style: TextStyle(color: Colors.blue),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Next payment due',
                              style: TextStyle(
                                color: Modular.get<MedicaminaThemeState>().getDarkMode() ? null : const Color.fromRGBO(87, 96, 106, 1),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.4,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text('Friday', style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () {},
                              child: const Text('View payment history'),
                            ),
                            // Text('Switch to yearly billing', style: TextStyle(color: Colors.blue),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment information',
                              style: TextStyle(
                                color: Modular.get<MedicaminaThemeState>().getDarkMode() ? null : const Color.fromRGBO(87, 96, 106, 1),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.4,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Update payment method'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Manage spending limit'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Redeem voucher'),
                            ),
                          ],
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
    );
  }
}
