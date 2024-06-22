import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/location_title.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/features/home/presentation/page/ride_details_page.dart';

class RatingRidePage extends StatefulWidget {
  const RatingRidePage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const RatingRidePage(),
      );

  @override
  State<RatingRidePage> createState() => _RatingRidePageState();
}

class _RatingRidePageState extends State<RatingRidePage> with OSMMixinObserver {
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
                zoomOption: ZoomOption(
                  initZoom: 8,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
                ),
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
                    children: [
                      const Text(
                        "How is your rider?",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "John Smith",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      RatingBar(
                        alignment: Alignment.center,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        onRatingChanged: (value) => debugPrint('$value'),
                        initialRating: 3,
                        maxRating: 5,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RoundButton(
                          title: "Rating rider",
                          onPressed: () {
                            Navigator.push(context, RideDetailsPage.route());
                          },
                          backgroundColor: TColor.primary,
                        ),
                      ),
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
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LocationTitle(
                                        locationIcon: Icons.circle,
                                        iconColor: Colors.blue,
                                        locationTitle:
                                            "54 Holly bank Rd, Southampton"),
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
        roadOption:
            const RoadOption(roadColor: Colors.green, roadBorderWidth: 4));
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      addMarker();
    }
  }
}
