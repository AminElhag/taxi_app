import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:intl/intl.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/location_title.dart';
import 'package:taxi_app/features/home/presentation/page/home_page.dart';

class RideDetailsPage extends StatefulWidget {
  const RideDetailsPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const RideDetailsPage(),
      );

  @override
  State<RideDetailsPage> createState() => _RideDetailsPageState();
}

class _RideDetailsPageState extends State<RideDetailsPage>
    with OSMMixinObserver {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, HomePage.route());
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: Text(
          "Trip Details",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Icon(
                Icons.help,
                color: TColor.primary,
              ),
              const SizedBox(
                width: 6,
              ),
              const Text("Help"),
              const SizedBox(
                width: 12,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  LocationTitle(
                      locationIcon: Icons.circle,
                      iconColor: Colors.blue,
                      locationTitle: "54 Holly bank Rd, Southampton"),
                  LocationTitle(
                      locationIcon: Icons.square,
                      iconColor: Colors.green,
                      locationTitle: "54 Holly bank Rd, Southampton"),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 200,
              child: OSMFlutter(
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
            ),
            Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "154.75 \$",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: TColor.primary),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Payment made successfully by cash",
                  style: TextStyle(fontSize: 18, color: TColor.secondaryText),
                ),
              ],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "15 min",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text("Time"),
                  ],
                ),
                SizedBox(height: 80, child: VerticalDivider()),
                Column(
                  children: [
                    Text("45 km",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("Distance"),
                  ],
                ),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Date & Time",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    DateFormat("d MMM, ''yy 'at' hh:mm").format(DateTime.now()),
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  )
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trip Type",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    "Normal",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  )
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Service Type",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    "Sedan",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  )
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You rated John Smith"),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                          "assets/img/profile_test_img.png"),
                    ),
                  ),
                  RatingBar.readOnly(
                    alignment: Alignment.center,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    initialRating: 3,
                    maxRating: 5,
                  )
                ],
              ),
            ),
            Container(
              width: context.width,
              height: 50,
              color: TColor.primary,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("RECEIPT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trip fares",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        "40.25 \$",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Yellow Taxi Fee",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        "20.00 \$",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "* Tax",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        "400.00 \$",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "* Tolls",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        "400.00 \$",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        "40.25 \$",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "* Top-up Added",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        "20.00 \$",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Payment",
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                      Text(
                        "840.00 \$",
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Text("This trip was towards your destination. You received a guaranteed.",maxLines: 2,overflow: TextOverflow.visible,)
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
