import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/round_button.dart';

class AddMoneyPage extends StatefulWidget {
  const AddMoneyPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const AddMoneyPage(),
      );

  @override
  State<AddMoneyPage> createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
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
          "Add money to my wallet",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available balance",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("4250.00\$",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Row(
                children: [
                  Text(
                    "\$",
                    style: TextStyle(fontSize: 20, color: TColor.secondaryText),
                  ),
                  Expanded(
                    child: CupertinoTextField.borderless(
                      keyboardType: TextInputType.number,
                      style:
                          TextStyle(fontSize: 20, color: TColor.secondaryText),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: TColor.primary, width: 2)),
                    child: const Text(
                      "+ 10",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: TColor.primary, width: 2)),
                    child: const Text(
                      "+ 20",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: TColor.primary, width: 2)),
                    child: const Text(
                      "+ 40",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("From bank account",style: TextStyle(fontSize: 20),),
                      IconButton(onPressed: () {

                      }, icon: const Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/img/profile_test_img.png",width: 64,height: 64,),
                      const SizedBox(width: 16,),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Khartoum Bank",style: TextStyle(fontSize: 20),),
                          Text("**** **** 1234"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RoundButton(title: "Submit request", onPressed: () {

              }, backgroundColor: TColor.primary),
            )
          ],
        ),
      ),
    );
  }
}
