import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/add_address_contorleer.dart';
import 'package:softagi/controller/register_controller.dart';
import 'package:softagi/view/Screens/login_screen.dart';
import 'package:softagi/view/widgets/custom_button.dart';
import 'package:softagi/view/widgets/custom_text.dart';
import 'package:softagi/view/widgets/custom_text_form_field.dart';
import 'package:softagi/view/widgets/custom_text_form_field_pass.dart';
import '../../const.dart';
import '../../theme.dart';
import 'imagepicker.dart';

class addAddressscreen extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? name, notes, city, region,details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
      key: _formkey,
      child: Center(
        child: SingleChildScrollView(
          child: Column(

            children: [
              // Container(
              //   margin: const EdgeInsetsDirectional.only(start: 15,),
              //   alignment: Alignment.topLeft,
              //   child: IconButton(onPressed: () {
              //     Navigator.pop(context);
              //   }, icon: const Icon(Icons.arrow_back_ios),
              //   ),
              // ),
              Center(
                child: Card(
                  elevation: 10,


                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsetsDirectional.only(
                      start: 15, end: 10, top: 15),
                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional.only(start: 15, end: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: custom_text(
                              text: 'Register',
                              style: titlestyle,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            padding:
                            const EdgeInsetsDirectional.only(end: 15),
                            child: custom_text(
                              text: 'Name:',
                              style: titlestyle,
                            )),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: custom_text_form_field(
                                  keyboardType: TextInputType.text,
                                  onSaved: (value) {
                                    name = value;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Your Name'.tr;
                                    } else {
                                      return null;
                                    }
                                  },
                                  hint: 'Enter your Name'.tr,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            padding:
                            const EdgeInsetsDirectional.only(end: 15),
                            child: custom_text(
                              text: 'details:',
                              style: titlestyle,
                            )),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: custom_text_form_field(
                                  phone: true,
                                  keyboardType: TextInputType.text,
                                  onSaved: (value) {
                                    details = value;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Your details'.tr;
                                    } else {
                                      return null;
                                    }
                                  },
                                  hint: 'Enter your details'.tr,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            padding:
                            const EdgeInsetsDirectional.only(end: 15),
                            child: custom_text(
                              text: 'city:',
                              style: titlestyle,
                            )),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: custom_text_form_field(
                                  keyboardType: TextInputType.text,
                                  onSaved: (value) {
                                    city = value;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Your city'.tr;
                                    } else {
                                      return null;
                                    }
                                  },
                                  hint: 'Enter your city'.tr,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            padding:
                            const EdgeInsetsDirectional.only(end: 15),
                            child: custom_text(
                              text: 'region:',
                              style: titlestyle,
                            )),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: custom_text_form_field(
                                  keyboardType: TextInputType.text,
                                  onSaved: (value) {
                                    region = value;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Your region'.tr;
                                    } else {
                                      return null;
                                    }
                                  },
                                  hint: 'Enter your region'.tr,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            padding:
                            const EdgeInsetsDirectional.only(end: 15),
                            child: custom_text(
                              text: 'notes:',
                              style: titlestyle,
                            )),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: custom_text_form_field(
                                  keyboardType: TextInputType.text,
                                  onSaved: (value) {
                                    notes = value;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Your notes'.tr;
                                    } else {
                                      return null;
                                    }
                                  },
                                  hint: 'Enter your notes'.tr,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: custom_button(
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              onPressed: () {
                                _formkey.currentState!.save();
                                if (_formkey.currentState!.validate()) {
                                  addAddress(
                                      name: name!,
                                      city: city!,
                                      details: details!,
                                      notes: notes!,
                                      region: region!
                                  )
                                      .then((value) {
                                    if (value == true) {
                                      Get.offAll(loginscreen());
                                    }
                                  });
                                }

                              },
                              child: custom_text(
                                text: 'Add Now',
                              )),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
