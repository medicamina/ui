import 'package:community_material_icon/community_material_icon.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:medicamina_ui/states.dart';

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }

  Color lighten([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = percent / 100;
    return Color.fromARGB(
      alpha,
      (red + ((255 - red) * value)).round(),
      (green + ((255 - green) * value)).round(),
      (blue + ((255 - blue) * value)).round(),
    );
  }

  Color avg(Color other) {
    final red = (this.red + other.red) ~/ 2;
    final green = (this.green + other.green) ~/ 2;
    final blue = (this.blue + other.blue) ~/ 2;
    final alpha = (this.alpha + other.alpha) ~/ 2;
    return Color.fromARGB(alpha, red, green, blue);
  }
}

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

class MedicaminaPsychologyBig5Widget extends StatefulWidget {
  MedicaminaPsychologyBig5Widget({Key? key}) : super(key: key);

  List<Color> get availableColors => const <Color>[
        AppColors.contentColorPurple,
        AppColors.contentColorYellow,
        AppColors.contentColorBlue,
        AppColors.contentColorOrange,
        AppColors.contentColorPink,
        AppColors.contentColorRed,
      ];

  Color barBackgroundColor =
      AppColors.contentColorWhite.darken().withOpacity(0.3);
  final Color barColor = AppColors.contentColorWhite;
  final Color touchedBarColor = AppColors.contentColorGreen;

  @override
  State<StatefulWidget> createState() => _MedicaminaPsychologyBig5Widget();
}

class _MedicaminaPsychologyBig5Widget
    extends State<MedicaminaPsychologyBig5Widget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Text(
                'Big-5',
                style: TextStyle(
                  fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode()
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(CommunityMaterialIcons.numeric_5_box_outline),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 388,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChartLine(title: 'Openness', number: 80, rate: 0.8),
                        ChartLine(
                            title: 'Conscientiousness', number: 70, rate: 0.7),
                        ChartLine(title: 'Extraversion', number: 50, rate: 0.5),
                        ChartLine(
                            title: 'Agreeableness', number: 40, rate: 0.4),
                        ChartLine(title: 'Neuroticism', number: 15, rate: 0.15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChartLine extends StatelessWidget {
  ChartLine({
    Key? key,
    this.rate = 0.5,
    this.title,
    this.number,
  })  : assert(title != null),
        assert(rate > 0),
        assert(rate <= 1),
        super(key: key);

  final double rate;
  final String? title;
  final int? number;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final lineWidget = constraints.maxWidth * rate;
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    if (number != null)
                      Text(
                        number.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.secondary.withAlpha(25),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  height: 30,
                  width: constraints.maxWidth,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  height: 30,
                  width: lineWidget,
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
