import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../Dada_controller/widgets/SignUpName_Widget.dart';
import '../../../Dada_controller/widgets/custom_button.dart';
import '../../../Dada_controller/widgets/text.dart';


class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _LoginState();
}

class _LoginState extends State<ShippingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController streetC = TextEditingController();
  final TextEditingController upazilaC = TextEditingController();
  final TextEditingController districtC = TextEditingController();
  bool isLoading = false;

  Map userData = {};

  getUserData() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    var d = await storage.read(key: "shipping");
    log("======D : $d");
    if (d != null) {
      userData = jsonDecode(d);
      log("======userData : ${userData['name']}");
      nameC.text = userData['name'];
      phoneC.text = userData['phone'];
      streetC.text = userData['street'];
      upazilaC.text = userData['upazila'];
      districtC.text = userData['district'];
    }
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF4F4F), Color(0xFFFF9A37)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: CustomText(
          text: "Shipping Information",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Let's Start",
                    fontSize: 22,
                    color: Colors.green.shade500,
                  ),
                  CustomText(
                    text: "Provide your shipping informations bellow...",
                    fontSize: 22,
                    color: Colors.green.shade300,
                  ),
                  SizedBox(height: 5),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF4F4F), Color(0xFFFF9A37)],
                        begin: AlignmentGeometry.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        spacing: 5,
                        children: [
                          CustomText(
                            text: "Enter your Name and Contact number",
                            color: Colors.white,
                          ),
                          NameFormField(
                            nameC: nameC,
                            validator: (v) {
                              if (v == null || v == "") {
                                return "Please enter Name";
                              }
                              return null;
                            },
                            title: 'Name',
                          ),
                          //phone
                          NameFormField(
                            nameC: phoneC,
                            validator: (v) {
                              if (v == null || v == "") {
                                return "Please enter Phone";
                              }
                              return null;
                            },
                            title: 'Phone',
                          ),
                        ],
                      ),
                    ),
                  ),
               Container(
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     colors: [Color(0xFFFF4F4F), Color(0xFFFF9A37)],
                     begin: AlignmentGeometry.topLeft,
                     end: Alignment.bottomRight,
                   ),
                   borderRadius: BorderRadius.circular(18),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(18.0),
                   child: Column(
                     spacing: 5,
                     children: [
                       CustomText(text: "Enter shipping informations",color: Colors.white,),
                       //street
                       NameFormField(
                         nameC: streetC,
                         validator: (v) {
                           if (v == null || v == "") {
                             return "Please enter Street";
                           }
                           return null;
                         },
                         title: 'Street',
                       ),
                       //upazilla
                       NameFormField(
                         nameC: upazilaC,
                         validator: (v) {
                           if (v == null || v == "") {
                             return "Please enter Upazela";
                           }
                           return null;
                         },
                         title: 'Upazela',
                       ),
                       //district
                       NameFormField(
                         nameC: districtC,
                         validator: (v) {
                           if (v == null || v == "") {
                             return "Please enter District";
                           }
                           return null;
                         },
                         title: 'District',
                       ),
                     ],
                   ),
                 ),
                 
                 
               ),

                  isLoading == true
                      ? Center(child: CircularProgressIndicator())
                      : CustomButton_widget(
                          title: 'Next',
                          onTap: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            var data = {
                              "name": nameC.text,
                              "phone": phoneC.text,
                              "street": streetC.text,
                              "upazila": upazilaC.text,
                              "district": districtC.text,
                            };
                            log("===========${data}==");
                            FlutterSecureStorage storage =
                                FlutterSecureStorage();
                            await storage.write(
                              key: "shipping",
                              value: jsonEncode(data),
                            );
                            Navigator.pop(context);
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
