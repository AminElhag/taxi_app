import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/features/menu/presentations/pages/earning_page.dart';
import 'package:taxi_app/features/menu/presentations/pages/my_profile_page.dart';
import 'package:taxi_app/features/menu/presentations/pages/settings_page.dart';
import 'package:taxi_app/features/menu/presentations/pages/summary_page.dart';
import 'package:taxi_app/features/menu/presentations/pages/switch_service_page.dart';
import 'package:taxi_app/features/menu/presentations/pages/wallet_page.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const MainMenuPage(),
      );

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.clear_rounded)),
        actions: const [
          Row(
            children: [
              Icon(
                Icons.help,
              ),
              SizedBox(
                width: 6,
              ),
              Text("Help"),
              SizedBox(
                width: 12,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: TColor.primary,
              height: 200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, EarningPage.route());
                      },
                      child: const Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/img/earning.png"),
                            radius: 40,
                          ),
                          Text(
                            "Earning",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MyProfilePage.route());
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/img/profile_test_img.png"),
                            radius: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white),
                                  alignment: Alignment.center,
                                  width: 55,
                                  child: const Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                      ),
                                      Text("3.12")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Text(
                            "John Smith",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, WalletPage.route());
                      },
                      child: const Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/img/wallet.png"),
                            radius: 40,
                          ),
                          Text(
                            "Wallet",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, SwitchServicePage.route());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.car_crash,size: 50,),
                    SizedBox(width: 16,),
                    Column(
                      children: [
                        Text("Switch Service Type",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                        Text("Change your service type"),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Icon(
                      Icons.home,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, SummaryPage.route());
              },
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Icon(
                      Icons.paste,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Summary",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Icon(
                      Icons.payments,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "My Subscription",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Icon(
                      Icons.notifications,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, SettingsPage.route());
              },
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Icon(
                      Icons.settings,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Icon(
                      Icons.logout,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
