import 'dart:developer';

import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/add_address_contorleer.dart';
import 'package:softagi/controller/add_order.dart';
import 'package:softagi/controller/address_controller.dart';
import 'package:softagi/controller/card_data_contolloer.dart';
import 'package:softagi/theme.dart';
import 'package:softagi/view/Screens/MainScreen.dart';
import 'package:softagi/view/Screens/home_screen.dart';
import 'package:softagi/view/widgets/custom_button.dart';
import 'package:softagi/view/widgets/custom_text.dart';
import 'package:softagi/view/widgets/custom_text_form_field.dart';

import 'add_address.dart';
import 'login_screen.dart';

class checkout extends StatefulWidget {
  int? number;

  @override
  _checkoutState createState() => _checkoutState();

  checkout({
    this.number,
  });
}

class _checkoutState extends State<checkout> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? name, notes, city, region, details;

  int steperindex = 0;
  final GetxController c = Get.put(AdressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  height: MediaQuery.of(context).size.height),
              child: Stepper(
                elevation: 0,
                type: StepperType.horizontal,
                steps: [
                  Step(
                      content: FutureBuilder(
                        future: gethomedata1(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              custom_text(text: 'Total Price'),
                              (snapshot.data == null)
                                  ? Text('')
                                  : Text(
                                      snapshot.data.toString(),
                                      style: titlestyle,
                                    ),
                            ],
                          );
                        },
                      ),
                      title: custom_text(
                        text: 'Order',
                        style: titlestyle,
                      ),
                      isActive: (steperindex == 0) ? true : false,
                      state: (steperindex == 0)
                          ? StepState.disabled
                          : StepState.complete),
                  Step(
                      content: Form(
                        key: _formkey,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 15, end: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding:
                                                const EdgeInsetsDirectional
                                                    .only(end: 15),
                                                child: custom_text(
                                                  text: 'Name:',
                                                  style: titlestyle,
                                                )),
                                          ),

                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: custom_text_form_field(
                                                keyboardType:
                                                    TextInputType.text,
                                                onSaved: (value) {
                                                  name = value;
                                                },
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please Enter Your Name'
                                                        .tr;
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
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding:
                                                const EdgeInsetsDirectional
                                                    .only(end: 15),
                                                child: custom_text(
                                                  text: 'details:',
                                                  style: titlestyle,
                                                )),
                                          ),

                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: custom_text_form_field(
                                                keyboardType:
                                                    TextInputType.text,
                                                onSaved: (value) {
                                                  details = value;
                                                },
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please Enter Your details'
                                                        .tr;
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                hint:
                                                    'Enter your details'.tr,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding:
                                                const EdgeInsetsDirectional
                                                    .only(end: 15),
                                                child: custom_text(
                                                  text: 'city:',
                                                  style: titlestyle,
                                                )),
                                          ),

                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: custom_text_form_field(
                                                keyboardType:
                                                    TextInputType.text,
                                                onSaved: (value) {
                                                  city = value;
                                                },
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please Enter Your city'
                                                        .tr;
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
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding:
                                                const EdgeInsetsDirectional
                                                    .only(end: 15),
                                                child: custom_text(
                                                  text: 'region:',
                                                  style: titlestyle,
                                                )),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: custom_text_form_field(
                                                keyboardType:
                                                    TextInputType.text,
                                                onSaved: (value) {
                                                  region = value;
                                                },
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please Enter Your region'
                                                        .tr;
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                hint:
                                                    'Enter your region'.tr,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding:
                                                const EdgeInsetsDirectional
                                                    .only(end: 15),
                                                child: custom_text(
                                                  text: 'notes:',
                                                  style: titlestyle,
                                                )),
                                          ),

                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: custom_text_form_field(
                                                keyboardType:
                                                    TextInputType.text,
                                                onSaved: (value) {
                                                  notes = value;
                                                },
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please Enter Your notes'
                                                        .tr;
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
                                                  addorder(id:id!);
                                                  print('sssssssssssssssssssss $id');
                                                });
                                              }

                                            },
                                            child: custom_text(
                                              text: 'Add Now',
                                            )),
                                      ),


                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      title: custom_text(
                        text: 'Address',
                        style: titlestyle,
                      ),
                      isActive: (steperindex == 1) ? true : false,
                      state: (steperindex <= 1)
                          ? StepState.disabled
                          : StepState.complete),
                ],
                onStepTapped: (int ind) {
                  setState(() {
                    steperindex = ind;
                  });
                },
                currentStep: steperindex,
                onStepContinue: () {
                  steperindex += 1;
                  if (steperindex != 2) {
                    setState(() {
                      if(steperindex==1){
                        _formkey.currentState!.save();
                        if (_formkey.currentState!
                            .validate()) {
                          addAddress(
                              name: name!,
                              city: city!,
                              details: details!,
                              notes: notes!,
                              region: region!)
                              .then((value) {
                            if (value == true) {
                              steperindex += 1;
                            }
                            else{
                              steperindex=1;
                            }
                          });
                        }
                      }
                    });
                  }


                },
                onStepCancel: () {
                  if (steperindex != 0) {
                    setState(() {
                      steperindex -= 1;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
