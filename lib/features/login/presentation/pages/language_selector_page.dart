import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/features/login/presentation/pages/mobile_number_page.dart';

class LanguageSelectorPage extends StatefulWidget {
  const LanguageSelectorPage({super.key, required this.showBackArrow});

  final bool showBackArrow;

  static route({bool showBackArrow = false}) => MaterialPageRoute(
        builder: (context) => LanguageSelectorPage(
          showBackArrow: showBackArrow,
        ),
      );

  @override
  State<LanguageSelectorPage> createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  List languageArray = [
    'Arabic',
    'English',
  ];

  int selectLanguage = 1;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: widget.showBackArrow ? AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded),),
          title: Text(
            "Choose Language",
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ) : AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Choose Language",
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: languageArray.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          selectLanguage = index;
                        });
                        Navigator.push(context, MobileNumberPage.route());
                      },
                      title: Text(
                        languageArray[index],
                        style: TextStyle(
                          color: index == selectLanguage
                              ? TColor.primary
                              : TColor.primaryText,
                          fontSize: 16,
                        ),
                      ),
                      trailing: index == selectLanguage
                          ? Icon(
                              Icons.sell,
                              color: TColor.primary,
                            )
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
  }
}