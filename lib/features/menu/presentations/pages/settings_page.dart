import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/features/menu/presentations/pages/edit_profile_page.dart';
import 'package:taxi_app/features/menu/presentations/pages/my_profile_page.dart';
import 'package:taxi_app/features/menu/presentations/pages/my_vehicle_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static route() => MaterialPageRoute(
    builder: (context) => const SettingsPage(),
  );

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear_rounded)),
        title: Text(
          "Settings",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 26,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MyProfilePage.route());
              },
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "My profile",
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
                Navigator.push(context, MyVehiclePage.route());
              },
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Icon(
                      Icons.directions_bus,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "My vehicle",
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
                      Icons.edit_document,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Personal documents",
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
                      Icons.account_balance_outlined,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Bank details",
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
                      Icons.lock,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Change password",
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
                      Icons.person,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Terms & Conditions",
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
                      Icons.privacy_tip,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Privacy policies",
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
                      Icons.info,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "About",
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
                      Icons.contact_emergency,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Contact us",
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
