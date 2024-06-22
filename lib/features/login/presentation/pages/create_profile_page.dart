import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/common_widget/text_field_widget.dart';
import 'package:taxi_app/features/login/presentation/pages/bank_details_page.dart';
import 'package:taxi_app/features/login/presentation/pages/otp_page.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const CreateProfilePage(),
      );

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  TextEditingController phoneController = TextEditingController();

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
          "Create profile",
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
              const SizedBox(
                height: 20,
              ),
              const TextFieldWidget(
                textInputType: TextInputType.name,
                hintText: 'John',
                labelText: 'First name',
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.name,
                hintText: 'Smith',
                labelText: 'Last name',
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.numberWithOptions(signed: true),
                hintText: "19019019019011",
                labelText: "National ID",
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.numberWithOptions(signed: true),
                hintText: "19019019019011",
                labelText: "Driving license number",
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.name,
                hintText: "Toyota",
                labelText: "Car Brand",
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.number,
                hintText: "42557",
                labelText: "Plat No",
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundButton(
                backgroundColor: TColor.primary,
                title: "Next",
                onPressed: () {
                  Navigator.push(context, BankDetailsPage.route());
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
