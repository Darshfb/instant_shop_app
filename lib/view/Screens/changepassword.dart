import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/forgetpassward_controller.dart';
import 'package:softagi/view/Screens/login_screen.dart';

import '../../theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_text_form_field_pass.dart';

class bottomsheet extends StatelessWidget {
String? passward;
String? email;
String? code;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios,),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(

                height: MediaQuery.of(context).size.height/1.6,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 10,end: 10
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10
                          ),
                          child: custom_text(text: 'Enter your Email',
                            style: titlestyle,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.only(
                            start: 10, end: 10,bottom: 10),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: custom_text_form_field(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty ||
                                !(value.contains('@')) ||
                                !(value.contains('.com'))) {
                              return 'Please Enter your correct Email'.tr;
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            email = value;
                          },
                          hint: 'Email'.tr,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 10,end: 10
                        ),
                        child: Container(
                          child: custom_text(text:'Enter your Code',
                            style: titlestyle,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.only(
                            start: 10, end: 10,top: 10,bottom: 10),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: custom_text_form_field(
                          prefixIcon: Icon(Icons.qr_code),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty){
                              return 'Enter Code'.tr;
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            code = value;
                          },
                          hint: 'Code'.tr,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 10,end: 10
                        ),
                        child: Container(
                          child: custom_text(text: 'Enter your Password'.tr,
                            style: titlestyle,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.only(
                            start: 10, end: 10,top: 10,bottom: 20),
                        alignment: Alignment.center,
                        child: custom_text_form_field_pass(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          icon: const Icon(Icons.lock),
                          hintText: 'Password'.tr,
                          onsaved: (value) {
                            passward = value;
                          },
                          validator: (value) {
                            // RegExp regex = RegExp(
                            //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            // print(value);
                            if (value.isEmpty ||
                                value.length < 3 ||
                                value.length > 16) {
                              return 'Please Enter your correct password'.tr;
                            } else {
                              // if (!regex.hasMatch(value))
                              //   return 'Enter valid password';
                              // else
                              return null;
                            }
                          },
                          helperText: 'Mostafa',
                          initialvalue: 'hey',
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        //width: double.infinity,
                        child: custom_button(
                          child: Container(
                            child: custom_text(
                              text: 'Change Password',
                              style: titlestyle,
                            ),
                          ),
                          textColor: Colors.white,
                          backgroundColor: Colors.red,
                          onPressed: () {
                            _formKey.currentState?.save();
                            if (_formKey.currentState!.validate()) {
                             resetpasswordapi(
                                email: '${email}',
                                code: '${code}',
                                passward:'${passward}',
                              ).then((value) {
                                if (value == true) {
                                  Get.offAll(loginscreen());
                                }
                              });
                            }
                          },
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
