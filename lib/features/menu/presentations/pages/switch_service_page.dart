import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';

class SwitchServicePage extends StatefulWidget {
  const SwitchServicePage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SwitchServicePage(),
      );

  @override
  State<SwitchServicePage> createState() => _SwitchServicePageState();
}

class _SwitchServicePageState extends State<SwitchServicePage> {
  final List chipList = [
    ServiceType("Executive", "What is Executive", true),
    ServiceType("Limo", "What is Limo", false),
    ServiceType("Economy", "What is Economy", false),
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
          "Add vehicle",
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
          child: Container(
            height: context.height - 100,
            child: ListView.builder(
              itemCount: chipList.length,
              itemBuilder: (context, index) {
                var item = chipList[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                            Text(item.detail),
                          ],
                        ),
                        Switch(
                          value: item.isSelected,
                          onChanged: (value) {
                            setState(() {
                              for (ServiceType value in chipList) {
                                value.isSelected = false;
                                if(value == chipList[index]){
                                  chipList[index].isSelected = true;
                                }
                              }
                            });
                          },
                        )
                      ],
                    ),
                    const Divider()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceType {
  final String title, detail;
  bool isSelected;

  ServiceType(this.title, this.detail, this.isSelected);
}
