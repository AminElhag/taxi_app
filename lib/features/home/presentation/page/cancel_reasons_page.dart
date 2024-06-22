import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/round_button.dart';

class CancelReasonsPage extends StatefulWidget {
  const CancelReasonsPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const CancelReasonsPage(),
      );

  @override
  State<CancelReasonsPage> createState() => _CancelReasonsPageState();
}

class _CancelReasonsPageState extends State<CancelReasonsPage> {
  final List _listOfReasonsCard = [
    RadioReasonItem(reason: "Rider is not here",index: 0),
    RadioReasonItem(reason: "Wrong address shown",index: 1),
    RadioReasonItem(reason: "Don't charge rider",index: 2),
  ];
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel)),
        title: Text(
          "Cancel Trip",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 8),
        child: RoundButton(
            title: "Done", onPressed: () {}, backgroundColor: TColor.primary),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: _listOfReasonsCard
                            .map(
                              (data) => InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  setState(() {
                                    groupValue = data.index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        groupValue: groupValue,
                                        value: data.index,
                                        onChanged: (index) {
                                          setState(() {
                                            groupValue = index ?? 0;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Text(data.reason),
                                            SizedBox(
                                              width: 6,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioReasonItem {
  String reason;
  int index;

  RadioReasonItem({required this.reason,required this.index});
}
