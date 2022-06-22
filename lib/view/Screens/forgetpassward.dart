import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:softagi/controller/forgetpassward_controller.dart';
import 'package:softagi/view/Screens/login_screen.dart';
import 'package:softagi/view/Screens/changepassword.dart';
import 'package:softagi/view/widgets/custom_button.dart';
import 'package:softagi/view/widgets/custom_text.dart';
import 'package:softagi/view/widgets/custom_text_form_field.dart';
import 'package:softagi/view/widgets/custom_text_form_field_pass.dart';

import '../../theme.dart';

class forgetpassward extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  String? passward;
  String? email;
  String? code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios,),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Container(
                height: MediaQuery.of(context).size.height/2.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: custom_text(
                        text:'Enter your Email',
                        style: titlestyle,
                      ),
                    ),
                    Container(

                      padding: const EdgeInsetsDirectional.only(
                          start: 10, end: 10,top: 10,bottom: 10),
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width / 1.1,
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
                    Container(
                      alignment: Alignment.center,
                      child: custom_button(
                        backgroundColor: Colors.red,
                        child: custom_text(text: 'Verify Email',),
                        onPressed: (){
                          _formKey.currentState?.save();
                          if (_formKey.currentState!.validate()) {
                            forgetpasswardapi(
                              email: '${email}',
                            ).then((value) {
                              if (value == true) {
                                Get.to(bottomsheet());
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
    );
  }
}
