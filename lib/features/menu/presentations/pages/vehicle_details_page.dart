import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/round_button.dart';

List<VehicleDetailItem> vehicleList = [
  VehicleDetailItem("Vehicle Registration", "Vehicle Registration", 1),
  VehicleDetailItem("Vehicle Insurance", "Expires: 6 jun 2025", 1),
  VehicleDetailItem("Vehicle Permit", "Expires: 6 jun 2025", 1),
  VehicleDetailItem("Vehicle Loan EMI", "Incorrect document type", 2),
];

class VehicleDetailsPage extends StatefulWidget {
  const VehicleDetailsPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const VehicleDetailsPage(),
      );

  @override
  State<VehicleDetailsPage> createState() => _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends State<VehicleDetailsPage> {
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
        title: Column(
          children: [
            Text(
              "Toyota",
              style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "ABC1234",
              style: TextStyle(color: TColor.secondaryText, fontSize: 16),
            ),
          ],
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
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(item.message),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: (item.statusId == 0)
                                    ? Colors.grey
                                    : (item.statusId == 1)
                                    ? Colors.green
                                    : Colors.red,),
                                borderRadius: BorderRadius.circular(6),
                                color: (item.statusId == 0)
                                    ? Colors.grey.shade100
                                    : (item.statusId == 1)
                                    ? Colors.green.shade100
                                    : Colors.red.shade100,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text((item.statusId == 0)
                                    ? "Wanting"
                                    : (item.statusId == 1)
                                        ? "Approve"
                                        : "Reject"),
                              ),
                            )
                          ],
                        ),
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
          title: "Save",
          onPressed: () {},
        ),
      ),
    );
  }
}

class VehicleDetailItem {
  final String name, message;
  final int statusId;

  VehicleDetailItem(this.name, this.message, this.statusId);
}
