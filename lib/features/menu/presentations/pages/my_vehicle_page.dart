import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/features/menu/presentations/pages/vehicle_details_page.dart';

List<VehicleItem> vehicleList = [
  VehicleItem("Toyota", "ABC1234", "assets/img/profile_test_img.png"),
  VehicleItem("Toyota", "ABC1234", "assets/img/profile_test_img.png"),
  VehicleItem("Toyota", "ABC1234", "assets/img/profile_test_img.png"),
];

class MyVehiclePage extends StatefulWidget {
  const MyVehiclePage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const MyVehiclePage(),
      );

  @override
  State<MyVehiclePage> createState() => _MyVehiclePageState();
}

class _MyVehiclePageState extends State<MyVehiclePage> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear_rounded)),
        centerTitle: true,
        title: Text(
          "My Vehicle",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height - 100,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var item = vehicleList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, VehicleDetailsPage.route());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(item.plat),
                            ],
                          ),
                          Image.asset(item.imageURI,width: 100,height: 100,)
                        ],
                      ),
                    );
                  },
                  itemCount: vehicleList.length,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: RoundButton(
          backgroundColor: TColor.primary,
          title: "Add vehicle",
          onPressed: () {},
        ),
      ),
    );
  }
}

class VehicleItem {
  final String name, plat, imageURI;

  VehicleItem(this.name, this.plat, this.imageURI);
}
