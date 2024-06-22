import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/common_widget/text_field_widget.dart';
import 'package:taxi_app/features/login/presentation/pages/document_upload_page.dart';
import 'package:taxi_app/features/login/presentation/pages/otp_page.dart';

class BankDetailsPage extends StatefulWidget {
  const BankDetailsPage({super.key});

  static route() => MaterialPageRoute(
    builder: (context) => const BankDetailsPage(),
  );

  @override
  State<BankDetailsPage> createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends State<BankDetailsPage> {
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
          "Bank details",
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
                hintText: 'Bank of Khartoum',
                labelText: 'Bank name',
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.name,
                hintText: 'Smith',
                labelText: 'Account holder name',
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.numberWithOptions(signed: true),
                hintText: "19019019019011",
                labelText: "Account number",
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.name,
                hintText: "YT123C",
                labelText: "Swift/IFSC code",
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
                  Navigator.push(context, DocumentUploadPage.route());
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
