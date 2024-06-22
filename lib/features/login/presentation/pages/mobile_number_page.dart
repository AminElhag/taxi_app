import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/features/login/presentation/pages/otp_page.dart';

class MobileNumberPage extends StatefulWidget {
  const MobileNumberPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const MobileNumberPage(),
      );

  @override
  State<MobileNumberPage> createState() => _MobileNumberPageState();
}

class _MobileNumberPageState extends State<MobileNumberPage> {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isValidNumber = false;
  PhoneNumber? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enter Mobile Number",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                "We need to verify your phone number.",
                style: TextStyle(color: TColor.primaryText),
              ),
            ),
            Center(
              child: Text(
                "Carrier charge may apply.",
                style: TextStyle(color: TColor.primaryText),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: IntlPhoneField(
                autofocus: true,
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      )),
                ),
                initialCountryCode: 'SA',
                onChanged: (value) {
                  if(value.number.isNotEmpty && value.isValidNumber()){
                    isValidNumber = true;
                    phoneNumber = value;
                  }else {
                    isValidNumber = false;
                  }
                },
                onCountryChanged: (value) {
                  isValidNumber = false;
                  _formKey.currentState?.reset();
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text:
                      'By continuing, I confirm that I have read & agree to the \n',
                  style: TextStyle(color: TColor.primaryText),
                ),
                TextSpan(
                  text: 'Terms & conditions ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: TColor.primaryText),
                ),
                TextSpan(
                    text: 'and ', style: TextStyle(color: TColor.primaryText)),
                TextSpan(
                  text: 'Privacy policy',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: TColor.primaryText),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            RoundButton(
              backgroundColor: TColor.primary,
              title: "Continue",
              onPressed: () {
                print("-------------------------------------------------$isValidNumber");
                if(isValidNumber){
                  print("-------------------------------------------------${_formKey.currentState}");
                  if (_formKey.currentState != null) {
                    print("-------------------------------------------------${_formKey.currentState!.validate()}");
                    if (_formKey.currentState!.validate()) {
                      print("-------------------------------------------------${phoneNumber}");
                      if(phoneNumber != null){
                        Navigator.push(context, OTPPage.route(phoneNumber!.completeNumber));
                      }
                    }
                  }
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
