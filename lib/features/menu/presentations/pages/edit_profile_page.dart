import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/common_widget/text_field_widget.dart';
import 'package:taxi_app/features/login/presentation/pages/bank_details_page.dart';
import 'package:taxi_app/features/login/presentation/pages/otp_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  static route() => MaterialPageRoute(
    builder: (context) => const EditProfilePage(),
  );

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
        title: Text(
          "Edit profile",
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
                textInputType: TextInputType.name,
                hintText: "email@mail.com",
                labelText: "Email",
              ),
              const SizedBox(height: 24),
              IntlPhoneField(
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
                onSaved: (newValue) {},
                onSubmitted: (p0) {},
              ),
              const SizedBox(
                height: 15,
              ),
              RoundButton(
                backgroundColor: TColor.primary,
                title: "Save",
                onPressed: () {

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
