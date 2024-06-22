import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';

class PlanRow extends StatelessWidget {
  const PlanRow({super.key, required this.obj, required this.onPressed});

  final Map obj;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black,blurRadius: 1)
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            obj['name'] as String? ?? "",
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 18,
            ),
          ),Text(
            obj['time'] as String? ?? "",
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 18,
            ),
          ),Text(
            obj['rides'] as String? ?? "",
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 18,
            ),
          ),Text(
            obj['cash_rides'] as String? ?? "",
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 18,
            ),
          ),Text(
            obj['km'] as String? ?? "",
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 18,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: onPressed, child: Text(
                  obj['price'] as String? ?? "",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 18,
                  ),
                ),),
              ],
          ),
        ],
      ),
    );
  }
}
