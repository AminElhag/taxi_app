import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/location_title.dart';
import 'package:taxi_app/features/home/presentation/page/run_ride_page.dart';

class TipRequestPage extends StatefulWidget {
  const TipRequestPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const TipRequestPage(),
      );

  @override
  State<TipRequestPage> createState() => _TipRequestPageState();
}

class _TipRequestPageState extends State<TipRequestPage> with OSMMixinObserver {
  late MapController controller;

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initPosition:
          GeoPoint(latitude: 23.02756018230479, longitude: 72.58131973941731),
    );
    controller.addObserver(this);
  }

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
              onMapIsReady: (mapIsRead) {
                if (mapIsRead) {
                  print(mapIsRead);
                }
              },
              onLocationChanged: (newLocation) {},
              onGeoPointClicked: (p0) {},
              controller: controller,
              osmOption: const OSMOption(
                enableRotationByGesture: true,
                /*userTrackingOption: const UserTrackingOption(
                  enableTracking: true,
                  unFollowUser: false,
                ),*/
                zoomOption: ZoomOption(
                  initZoom: 8,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
                ),
                /*userLocationMarker: UserLocationMaker(
                  personMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.location_history_rounded,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                  directionArrowMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.location_on_rounded,
                      size: 48,
                    ),
                  ),
                ),*/
                roadConfiguration: RoadOption(
                  roadColor: Colors.yellowAccent,
                ),
                showDefaultInfoWindow: false,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "25 min",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("\$120.5"),
                              Text("4.5 Km"),
                              Text("3.5"),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LocationTitle(
                              locationIcon: Icons.circle,
                              iconColor: Colors.blue,
                              locationTitle: "54 Holly bank Rd, Southampton"),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LocationTitle(
                              locationIcon: Icons.square,
                              iconColor: Colors.green,
                              locationTitle: "54 Holly bank Rd, Southampton"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context, RunRidePage.route());
                          },
                          minWidth: double.maxFinite,
                          elevation: 0,
                          color: TColor.primary,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Tap to accept",
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 16,
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
                                          color: TColor.secondary,
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                    ),
                                    Text(
                                      "36",
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                              width: 130,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.close),
                                    Text(
                                      "No Thanks",
                                      style: TextStyle(
                                        color: TColor.secondaryText,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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

  void addMarker() async {
    await controller.setMarkerOfStaticPoint(
        id: "pickup",
        markerIcon: const MarkerIcon(
          iconWidget: Icon(
            Icons.pin_drop_sharp,
            color: Colors.blue,
          ),
        ));
    await controller.setMarkerOfStaticPoint(
        id: "drop_off",
        markerIcon: const MarkerIcon(
          iconWidget: Icon(
            Icons.pin_drop_sharp,
            color: Colors.red,
          ),
        ));
    await controller.setStaticPosition(
        [GeoPoint(latitude: 15.6908482, longitude: 32.4721984)], "pickup");
    await controller.setStaticPosition(
        [GeoPoint(latitude: 15.7106988, longitude: 32.4910101)], "drop_off");

    loadMapRoad();

  }

  void loadMapRoad() async {
    await controller.drawRoad(
        GeoPoint(latitude: 15.6908482, longitude: 32.4721984),
        GeoPoint(latitude: 15.7106988, longitude: 32.4910101),
        roadType: RoadType.car,
        roadOption: const RoadOption(roadColor: Colors.green,roadBorderWidth: 4));
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      addMarker();
    }
  }
}
