import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina_ui/dash/states.dart';
import 'package:medicamina_ui/states.dart';

var currentIndex = 0;
final drugs = Modular.get<MedicaminaTodaysDrugs>().getDrugs();

class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // Override the method to return a dummy simulation
    return ScrollSpringSimulation(spring, position.pixels, 0.0, velocity);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return offset;
  }
}

class MedicaminaDashEdictsMedicationWidget extends StatefulWidget {
  const MedicaminaDashEdictsMedicationWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashEdictsMedicationWidget> createState() =>
      _MedicaminaDashEdictsMedicationWidget();
}

class _MedicaminaDashEdictsMedicationWidget
    extends State<MedicaminaDashEdictsMedicationWidget> {
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    setState(() {
      _pageController = PageController(
        viewportFraction: MediaQuery.of(context).size.width > 1000
            ? 0.3
            : MediaQuery.of(context).size.width > 600
                ? 0.4
                : 0.6,
      );
    });

    Widget _getTodaysDrugs() {
      if (drugs.isEmpty) {
        return const SizedBox(
          height: 110,
          child: Card(
            child: Center(
              child: Text(
                'No medications today',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        );
      }
      return SizedBox(
        height: 110,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          physics: ClampingScrollPhysics(),
          itemCount: drugs.length,
          onPageChanged: (value) {
            currentIndex = value;
          },
          padEnds: false,
          controller: _pageController,
          itemBuilder: (context, index) {
            return _DailyMedicationCarouselItem(
              itemIndex: index.toDouble(),
              pageController: _pageController,
            );
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
                      'Daily medications',
                      style: TextStyle(
                          fontWeight:
                              Modular.get<MedicaminaThemeState>().getDarkMode()
                                  ? FontWeight.normal
                                  : FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      tooltip: 'Medication history',
                      icon: const Icon(Icons.history),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        _getTodaysDrugs(),
      ],
    );
  }
}

class _DailyMedicationCarouselItem extends StatefulWidget {
  const _DailyMedicationCarouselItem(
      {Key? key, required this.pageController, required this.itemIndex})
      : super(key: key);
  final PageController pageController;
  final double itemIndex;

  @override
  State<_DailyMedicationCarouselItem> createState() =>
      __DailyMedicationCarouselItem();
}

class __DailyMedicationCarouselItem extends State<_DailyMedicationCarouselItem>
    with AutomaticKeepAliveClientMixin<_DailyMedicationCarouselItem> {
  late bool checked = false;

  @override
  void initState() {
    super.initState();
    checked = drugs[widget.itemIndex.toInt()].getTaken();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 12),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    drugs[widget.itemIndex.toInt()].getIcon(),
                    size: 26,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    drugs[widget.itemIndex.toInt()].getName(),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    drugs[widget.itemIndex.toInt()].getDosage(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: kIsWeb
                        ? (MediaQuery.of(context).size.width > 290 ? 6 : 0)
                        : 5,
                  ),
                  Center(
                    child: Text(
                      drugs[widget.itemIndex.toInt()].getTime(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? (MediaQuery.of(context).size.width > 290 ? 10 : 6)
                        : 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      drugs[widget.itemIndex.toInt()].setTaken(!checked);
                      setState(() {
                        checked = drugs[widget.itemIndex.toInt()].getTaken();
                      });
                      if (!checked &&
                          widget.pageController.page == currentIndex) {
                        return;
                      }
                      if (widget.itemIndex < widget.pageController.page!) {
                        widget.pageController.previousPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeIn,
                        );
                        return;
                      }
                      if (widget.pageController.page != drugs.length - 1) {
                        widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeIn,
                        );
                        return;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(0),
                      backgroundColor: checked
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.background,
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.only(top: 8, left: 0, right: 0, bottom: 8),
                      child: Icon(Icons.check),
                    ),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? (MediaQuery.of(context).size.width > 290 ? 6 : 0)
                        : 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
