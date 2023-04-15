import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicamina/dash/states.dart';
import 'package:medicamina/states.dart';
import 'package:qr_flutter/qr_flutter.dart';

var drugs = Modular.get<MedicaminaTodaysDrugs>().getDrugs();
var eScripts = ['', ''];
var recentReport = 'Hugh Mungus';
// var eScripts = [];
var currentIndex = 0;

class MedicaminaDashEdictsMobileWidget extends StatefulWidget {
  const MedicaminaDashEdictsMobileWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashEdictsMobileWidget> createState() => _MedicaminaDashEdictsMobileWidgetState();
}

class _MedicaminaDashEdictsMobileWidgetState extends State<MedicaminaDashEdictsMobileWidget> {
  late PageController _pageController;

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
      child: ListView(
        children: [
          SizedBox(
            height: 110.0,
            child: PageView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: drugs.length,
              onPageChanged: (value) {
                currentIndex = value;
              },
              padEnds: false,
              controller: _pageController,
              itemBuilder: (context, index) {
                return _DailyMedicationCarouselItem(itemIndex: index.toDouble(), pageController: _pageController);
              },
            ),
          )
        ],
      ),
    );
  }

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
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width >= 700 ? 300 : 240,
            child: PageView.builder(
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
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(
        viewportFraction: MediaQuery.of(context).size.width > 1000
            ? 0.3
            : MediaQuery.of(context).size.width > 600
                ? 0.4
                : 0.6);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Daily medications',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
            // Recent reports
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Recent doctor reports',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          icon: const Icon(Icons.library_books),
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
            // E-scripts
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'E-scripts',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _getEScripts(),
            // Your health
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Your health',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width >= 2500
                    ? 1250
                    : MediaQuery.of(context).size.width >= 1250
                        ? 1200
                        : null,
                child: AspectRatio(
                  aspectRatio: MediaQuery.of(context).size.width <= 700 ? 3 : 5,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: PageController(viewportFraction: MediaQuery.of(context).size.width <= 700 ? 0.4 : 0.2),
                    padEnds: false,
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: Opacity(
                              opacity: Modular.get<MedicaminaThemeState>().getDarkMode() ? 0.7 : 1,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 0,
                                color: Color.fromRGBO(225, 255, 213, 1),
                                child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  onTap: () {
                                    print("tapped");
                                  },
                                  highlightColor: Color.fromRGBO(225, 255, 213, 0.5),
                                  splashColor: Color.fromRGBO(56, 192, 9, 0.5),
                                  child: Center(
                                    child: Icon(
                                      Icons.medication_outlined,
                                      size: 40,
                                      color: Color.fromRGBO(56, 192, 9, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'Vitamins',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: Opacity(
                              opacity: Modular.get<MedicaminaThemeState>().getDarkMode() ? 0.7 : 1,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 0,
                                color: Color.fromRGBO(255, 235, 235, 1),
                                child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  onTap: () {
                                    print("tapped");
                                  },
                                  highlightColor: Color.fromRGBO(255, 235, 235, 0.5),
                                  splashColor: Color.fromRGBO(251, 0, 15, 0.5),
                                  child: Center(
                                    child: Icon(
                                      CommunityMaterialIcons.paper_roll_outline,
                                      size: 40,
                                      color: Color.fromRGBO(251, 0, 15, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'Allergies',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: Opacity(
                              opacity: Modular.get<MedicaminaThemeState>().getDarkMode() ? 0.7 : 1,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 0,
                                color: Color.fromRGBO(231, 236, 255, 1),
                                child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  onTap: () {
                                    print("tapped");
                                  },
                                  highlightColor: Color.fromRGBO(231, 236, 255, 0.5),
                                  splashColor: Color.fromRGBO(0, 108, 197, 0.5),
                                  child: Center(
                                    child: Icon(
                                      CommunityMaterialIcons.blender,
                                      size: 40,
                                      color: Color.fromRGBO(0, 108, 197, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'Diet',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: Opacity(
                              opacity: Modular.get<MedicaminaThemeState>().getDarkMode() ? 0.7 : 1,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 0,
                                color: Color.fromRGBO(237, 229, 255, 1),
                                child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  onTap: () {
                                    print("tapped");
                                  },
                                  highlightColor: Color.fromRGBO(237, 229, 255, 0.5),
                                  splashColor: Color.fromRGBO(145, 18, 189, 0.5),
                                  child: Center(
                                    child: Icon(
                                      CommunityMaterialIcons.thermometer,
                                      size: 40,
                                      color: Color.fromRGBO(145, 18, 189, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'Sickness',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: Opacity(
                              opacity: Modular.get<MedicaminaThemeState>().getDarkMode() ? 0.7 : 1,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 0,
                                color: Color.fromRGBO(255, 239, 216, 1),
                                child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  onTap: () {
                                    print("tapped");
                                  },
                                  highlightColor: Color.fromRGBO(255, 239, 216, 0.5),
                                  splashColor: Color.fromRGBO(246, 132, 53, 0.5),
                                  child: Center(
                                    child: Icon(
                                      CommunityMaterialIcons.bandage,
                                      size: 40,
                                      color: Color.fromRGBO(246, 132, 53, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'Pain & Injury',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
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
      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 6, right: 6),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            QrImage(
              gapless: false,
              foregroundColor: Modular.get<MedicaminaThemeState>().getDarkMode() ? Colors.white : Colors.black,
              data: 'https://www.digitalhealth.gov.au/initiatives-and-programs/electronic-prescriptions',
              version: QrVersions.auto,
              size: MediaQuery.of(context).size.width >= 700 ? 220 : 160,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text('Warfarin', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  const SizedBox(height: 3),
                  const Text('2 repeats left', textAlign: TextAlign.center),
                  const SizedBox(height: 3),
                  Wrap(
                    children: [
                      Text(
                        '12 days left of current script',
                        style: Theme.of(context).textTheme.caption,
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
    );
  }
}

class _DailyMedicationCarouselItem extends StatefulWidget {
  const _DailyMedicationCarouselItem({Key? key, required this.pageController, required this.itemIndex}) : super(key: key);
  final PageController pageController;
  final double itemIndex;

  @override
  State<_DailyMedicationCarouselItem> createState() => __DailyMedicationCarouselItem();
}

class __DailyMedicationCarouselItem extends State<_DailyMedicationCarouselItem> with AutomaticKeepAliveClientMixin<_DailyMedicationCarouselItem> {
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
        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 12),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(drugs[widget.itemIndex.toInt()].getIcon(), size: 26, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 2),
                  Text(
                    drugs[widget.itemIndex.toInt()].getName(),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    drugs[widget.itemIndex.toInt()].getDosage(),
                    style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(height: kIsWeb ? (MediaQuery.of(context).size.width > 290 ? 6 : 0) : 5),
                  Center(
                    child: Text(
                      drugs[widget.itemIndex.toInt()].getTime(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: kIsWeb ? (MediaQuery.of(context).size.width > 290 ? 10 : 6) : 8),
                  ElevatedButton(
                    onPressed: () {
                      drugs[widget.itemIndex.toInt()].setTaken(!checked);
                      setState(() {
                        checked = drugs[widget.itemIndex.toInt()].getTaken();
                      });
                      if (!checked && widget.pageController.page == currentIndex) {
                        return;
                      }
                      if (widget.itemIndex < widget.pageController.page!) {
                        widget.pageController.previousPage(duration: const Duration(milliseconds: 700), curve: Curves.easeIn);
                        return;
                      }
                      if (widget.pageController.page != drugs.length - 1) {
                        widget.pageController.nextPage(duration: const Duration(milliseconds: 700), curve: Curves.easeIn);
                        return;
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 8, left: 0, right: 0, bottom: 8),
                      child: Icon(Icons.check),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(0),
                      backgroundColor: checked ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                    ),
                  ),
                  SizedBox(height: kIsWeb ? (MediaQuery.of(context).size.width > 290 ? 6 : 0) : 0),
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
