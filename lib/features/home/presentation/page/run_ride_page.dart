import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/icon_title_button.dart';
import 'package:taxi_app/common_widget/location_title.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/features/home/presentation/page/cancel_reasons_page.dart';
import 'package:taxi_app/features/home/presentation/page/rating_ride_page.dart';

class RunRidePage extends StatefulWidget {
  const RunRidePage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const RunRidePage(),
      );

  @override
  State<RunRidePage> createState() => _RunRidePageState();
}

class _RunRidePageState extends State<RunRidePage> with OSMMixinObserver {
  late MapController controller;
  bool isOpen = false;
  int rideStatus = 0;
  bool isEnable = true;

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
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: (rideStatus == 0) ? null : (rideStatus == 1) ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TimerCountdown(
                            spacerWidth: 6,
                            timeTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: TColor.primaryText),
                            enableDescriptions: false,
                            format: CountDownTimerFormat.minutesSeconds,
                            endTime: DateTime.now().add(
                              const Duration(
                                minutes: 3,
                                seconds: 00,
                              ),
                            ),
                            onEnd: () {
                              print("Timer finished");
                            },
                          ),
                          Text("Watting for rider")
                        ],
                      ),
                    ):
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 130,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(Icons.navigation,color: TColor.primary,),
                              SizedBox(width: 6),
                              Text("Navigate"),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
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
                          const Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "2 min",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage(
                                        "assets/img/profile_test_img.png"),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "0.5 km",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              Text(
                                "Arrived to John Smith",
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Icon(
                              Icons.call,
                              size: 15,
                            ),
                          ),
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
                                child: IconTitleButton(
                                  statusIcon: Icons.chat,
                                  unit: "Chat",
                                  iconColor: TColor.lightGray,
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: IconTitleButton(
                                  statusIcon: Icons.info,
                                  unit: "Info",
                                  iconColor: TColor.lightGray,
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: IconTitleButton(
                                  statusIcon: Icons.cancel,
                                  unit: "Cancel",
                                  iconColor: TColor.lightGray,
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) =>
                                          BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 5, sigmaY: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: 200,
                                                  width:
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(
                                                        8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        const Text(
                                                          "Cancel John's trip?",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700),
                                                        ),
                                                        RoundButton(
                                                          backgroundColor:
                                                          Colors.red,
                                                          title:
                                                          "Yes, Cancel",
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                CancelReasonsPage
                                                                    .route());
                                                          },
                                                        ),
                                                        RoundButton(
                                                          backgroundColor:
                                                          TColor
                                                              .lightGray,
                                                          title: "No",
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                          : const Column(),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RoundButton(
                          backgroundColor: isEnable ? TColor.primary : TColor.lightGray,
                          title: (rideStatus == 0) ? "Arrived" :(rideStatus == 1) ? "Start" : "Completed",
                          onPressed: () {
                            if(isEnable){
                              if(rideStatus == 1) {
                                setState(() {
                                  rideStatus++;
                                });
                              }else if(rideStatus == 0){
                                setState(() {
                                  rideStatus++;
                                });
                              }else{
                                Navigator.push(context, RatingRidePage.route());
                              }
                            }
                          },
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
