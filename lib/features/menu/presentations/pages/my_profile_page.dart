import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/features/menu/presentations/pages/edit_profile_page.dart';
import 'package:taxi_app/features/menu/presentations/pages/settings_page.dart';
import 'package:taxi_app/features/menu/presentations/pages/summary_page.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const MyProfilePage(),
      );

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        leading: IconButton(
            onPressed: () {Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, EditProfilePage.route());
            },
            child: const Row(
              children: [
                Icon(
                  Icons.edit,
                ),
                SizedBox(
                  width: 6,
                ),
                SizedBox(
                  width: 12,
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: TColor.primary,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 50,),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: TColor.placeholder.withOpacity(0.5),
                          borderRadius: BorderRadiusDirectional.circular(6),
                          border: Border.all(color: Colors.white)
                        ),
                        height: 270,
                        width: context.width - 60,
                        child: Column(
                          children: [
                            Spacer(),
                            Row(
                              children: [
                                const Spacer(),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/img/profile_test_img.png"),
                                      radius: 50,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          const Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white),
                                            alignment: Alignment.center,
                                            width: 55,
                                            child: const Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
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
                                          fontSize: 28, fontWeight: FontWeight.w600),
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      width: context.width - 70,
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(height: 80, ),
                                          Column(
                                            children: [
                                              Text(
                                                "3250",
                                                style:
                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                              ),
                                              Text("Total trips"),
                                            ],
                                          ),
                                          SizedBox(height: 80, child: VerticalDivider()),
                                          Column(
                                            children: [
                                              Text("2.5",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold, fontSize: 20)),
                                              Text("Years"),
                                            ],
                                          ),
                                          SizedBox(height: 80, ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                  ],
                                ),
                                const Spacer(),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
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
                      Icons.phone_android,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "+249 96 123 1234",
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
                      Icons.mail,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "aminjalalzoom@gmail.com",
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
                      Icons.translate,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Arabic & English",
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
                      Icons.home,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    "6 str, Althawra harra 13, Omdurman",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
          ],
        ),
      ),
    );
  }
}
