import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/icon_title_subtitle_button.dart';
import 'package:taxi_app/features/home/presentation/page/tip_request_page.dart';
import 'package:taxi_app/features/menu/presentations/pages/main_menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    areaLimit: BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west: 5.9559113,
    ),
  );
  bool isOpen = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            OSMFlutter(
              controller: controller,
              osmOption: OSMOption(
                userTrackingOption: const UserTrackingOption(
                  enableTracking: true,
                  unFollowUser: false,
                ),
                zoomOption: const ZoomOption(
                  initZoom: 8,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
                ),
                userLocationMarker: UserLocationMaker(
                  personMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.location_history_rounded,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                  directionArrowMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.double_arrow,
                      size: 48,
                    ),
                  ),
                ),
                roadConfiguration: const RoadOption(
                  roadColor: Colors.yellowAccent,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, TipRequestPage.route());
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: TColor.secondary,
                                borderRadius: BorderRadius.circular(35),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 12,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "GO",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(color: Colors.white12)),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.my_location))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 12,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isOpen = !isOpen;
                              });
                            },
                            icon: Icon(
                              !isOpen
                                  ? Icons.arrow_downward
                                  : Icons.arrow_upward,
                              size: 15,
                            ),
                          ),
                          const Text(
                            "You are offline",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 40,
                          )
                        ],
                      ),
                      !isOpen
                          ? Column(
                              children: [
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: IconTitleSubtitleButton(
                                        statusIcon: Icons.check_circle_sharp,
                                        percentage: "82.3%",
                                        unit: "Acceptance",
                                        iconColor: TColor.secondary,
                                        onPressed: () {},
                                      ),
                                    ),
                                    Expanded(
                                      child: IconTitleSubtitleButton(
                                        statusIcon:
                                            Icons.generating_tokens_rounded,
                                        percentage: "72.5%",
                                        unit: "Ratting",
                                        iconColor: TColor.secondary,
                                        onPressed: () {},
                                      ),
                                    ),
                                    Expanded(
                                      child: IconTitleSubtitleButton(
                                        statusIcon: Icons.cancel,
                                        percentage: "8.32%",
                                        unit: "Cancellations",
                                        iconColor: TColor.secondary,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Column(),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 40,
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Text(
                                "129.12 \$",
                                style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(color: Colors.white12)),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(context, MainMenuPage.route());
                            },
                            icon: const Icon(Icons.group))
                      ],
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
