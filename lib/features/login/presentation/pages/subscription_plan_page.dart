import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/plan_row.dart';

class SubscriptionPlanPage extends StatefulWidget {
  const SubscriptionPlanPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SubscriptionPlanPage(),
      );

  @override
  State<SubscriptionPlanPage> createState() => _SubscriptionPlanPageState();
}

class _SubscriptionPlanPageState extends State<SubscriptionPlanPage> {
  List planArr = [
    {
      "name": "Basic",
      "time": "1 month",
      "rides": "10 by day",
      "cash_rides": "2 Cash rides",
        "km": "50 km travel rides",
      "price": "TRY Free",
    },
    {
      "name": "Classic",
      "time": "3 month",
      "rides": "10 by day",
      "cash_rides": "2 Cash rides",
      "km": "50 km travel rides",
      "price": "Buy at \$20.99",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: Text(
          "Subscription plan",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var obj = planArr[index] as Map? ?? {};
          return PlanRow(obj: obj, onPressed: () {

          },);
        },
        itemCount: planArr.length,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      ),
    );
  }
}
