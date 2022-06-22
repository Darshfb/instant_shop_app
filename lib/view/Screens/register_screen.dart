import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/register_controller.dart';
import 'package:softagi/view/Screens/login_screen.dart';
import 'package:softagi/view/widgets/custom_button.dart';
import 'package:softagi/view/widgets/custom_text.dart';
import 'package:softagi/view/widgets/custom_text_form_field.dart';
import 'package:softagi/view/widgets/custom_text_form_field_pass.dart';
import '../../const.dart';
import '../../theme.dart';
import 'imagepicker.dart';

class register extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? name,
      phone,
      email,
      password;
  String image='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,

          ),
        ),
      ),
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
                                text: 'Phone:',
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
                                    keyboardType: TextInputType.phone,
                                    onSaved: (value) {
                                      phone = value;
                                    },
                                    validator: (value) {
                                      print(value);
                                      if (value.length < 11 ||
                                          value.length > 11 ||
                                          value.isEmpty) {
                                        return 'Please Enter Your correct Phone '.tr;
                                      } else
                                        return null;
                                    },
                                    hint: 'Enter your Phone'.tr,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 15),
                              child: custom_text(
                                text: 'Email:',
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
                                      email = value;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          !(value.contains('@')) ||
                                          !(value.contains('.com'))) {
                                        return 'Please Enter you correct Email'.tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                    hint: 'Enter your Email'.tr,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 15),
                              child: custom_text(
                                text: 'Password:',
                                style: titlestyle,
                              )),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: custom_text_form_field_pass(
                                    obscureText: true,
                                    onsaved: (value) {
                                      password = value;
                                    },
                                    keyboardType: TextInputType.text,
                                    hintText: 'Enter your Password'.tr,
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          value.length < 3 ||
                                          value.length > 16) {
                                        return 'Please Enter your correct password'.tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CameraScreen(),
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
                                    registerApi(
                                            email: email!,
                                            name: name!,
                                            image: base64Image,
                                            password: password!,
                                            phone: phone!)
                                        .then((value) {
                                      if (value == true) {
                                        Get.offAll(loginscreen());
                                      }
                                    });
                                  }
                                },
                                child: custom_text(
                                  text: 'Register Now',
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
