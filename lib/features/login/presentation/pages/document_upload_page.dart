import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/document_row.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/features/login/presentation/pages/add_vehicle_page.dart';

class DocumentUploadPage extends StatefulWidget {
  const DocumentUploadPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const DocumentUploadPage(),
      );

  @override
  State<DocumentUploadPage> createState() => _DocumentUploadPageState();
}

class _DocumentUploadPageState extends State<DocumentUploadPage> {
  TextEditingController phoneController = TextEditingController();

  List documentList = [
    {
      "name": "Birth Certification",
      "detail":
          """A birth certificate is a vital record issued by a government that officially documents the birth of an individual. It serves as legal 
       evidence of identity, citizenship, and nationality. The certificate 
       includes essential details such as the child’s full name, date and time
       of birth, place of birth (city, county, and state), and parental 
       information. There are two types of birth certificates: informational 
       (not certified) and certified (official and legally recognized). 
       The latter can be used for various purposes, including obtaining a
       driver’s license, passport, or social security card
      """,
      "info": "",
      "status": DocumentStatus.uploaded
    },
    {
      "name": "Driving Licence",
      "detail": "A driving licence is an official do...",
      "info": "",
      "status": DocumentStatus.uploading
    },
    {
      "name": "Passport",
      "detail": "A passport is a travel document...",
      "info": "",
      "status": DocumentStatus.upload
    },
    {
      "name": "Election Card",
      "detail": "Incorrect document type",
      "info": "",
      "status": DocumentStatus.uploading
    },
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
          "Your documents",
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
                height: 16,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = documentList[index] as Map? ?? {};
                  return DocumentRow(
                    obj: item,
                    onPressed: () {},
                    onInfo: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                              width: context.width,
                              height: context.height - 100,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 46, horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(color: Colors.black, blurRadius: 3)
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        item['detail'],
                                        style: TextStyle(
                                          color: TColor.primaryText,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Ok",
                                            style: TextStyle(
                                                color: TColor.secondaryText,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    onUpload: () {},
                    onAction: () {},
                    status: item['status'] as DocumentStatus? ??
                        DocumentStatus.upload,
                  );
                },
                itemCount: documentList.length,
              ),
              const SizedBox(
                height: 16,
              ),
              RoundButton(
                backgroundColor: TColor.primary,
                title: "Next",
                onPressed: () {
                  Navigator.push(context, AddVehiclePage.route());
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
