import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/common_widget/text_field_widget.dart';
import 'package:taxi_app/features/home/presentation/page/home_page.dart';
import 'package:taxi_app/features/login/presentation/pages/add_vehicle_document.dart';
import 'package:taxi_app/features/login/presentation/pages/document_upload_page.dart';
import 'package:taxi_app/features/login/presentation/pages/otp_page.dart';
import 'package:taxi_app/features/login/presentation/pages/subscription_plan_page.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  static route() => MaterialPageRoute(
    builder: (context) => const AddVehiclePage(),
  );

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
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
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const TextFieldWidget(
                textInputType: TextInputType.name,
                hintText: 'Micro',
                labelText: 'Service type',
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.name,
                hintText: 'BMW',
                labelText: 'Brand',
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.numberWithOptions(signed: true),
                hintText: "ABC",
                labelText: "Model",
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.name,
                hintText: "BMW",
                labelText: "Manufacture",
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.name,
                labelText: "Plat No",
                hintText: "YTP123",
              ),
              const SizedBox(height: 24),
              const TextFieldWidget(
                textInputType: TextInputType.name,
                labelText: "Color",
                hintText: "White",
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundButton(
                backgroundColor: TColor.primary,
                title: "Register",
                onPressed: () {
                  Navigator.push(context, HomePage.route());
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
