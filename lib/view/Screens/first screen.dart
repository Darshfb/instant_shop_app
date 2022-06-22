import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/AppLanguage/app_language.dart';
import 'package:softagi/services/theme_services.dart';
import 'package:softagi/view/Screens/login_screen.dart';
import 'package:softagi/view/widgets/custom_button.dart';
import 'package:softagi/view/widgets/custom_text.dart';

import '../../theme.dart';

class firstscreen extends StatefulWidget {
  const firstscreen({Key? key}) : super(key: key);

  @override
  _firstscreenState createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  final AppLanguage d=Get.put(AppLanguage());
  final ThemeController c = Get.put(ThemeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment:  Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/726739.png'),
                opacity: 0.3,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Language'.tr,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color:  Colors.red
                ),),

                GetBuilder<AppLanguage>(
                    init: AppLanguage(),
                    builder: (controller) => DropdownButton(
                      isDense: true,

                      elevation: 10,

                      items: [
                        DropdownMenuItem(
                          child: Text('en'),
                          value: 'en',
                        ),
                        DropdownMenuItem(
                          child: Text('ar'),
                          value: 'ar',
                        ),
                      ],
                      value: controller.appLocale,
                      onChanged: (value) {
                        controller.appLocale='en';
                        controller.changeLanguage('$value');
                        Get.updateLocale(Locale('$value'));
                      },
                    )),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Theme Mode'.tr,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color:  Colors.red
                ),),
                GetBuilder<ThemeController>(
                    init: ThemeController(),
                    builder: (controller) => CupertinoSwitch(
                      activeColor: Colors.black45,
                      thumbColor: Colors.teal,
                      trackColor: Colors.white,
                      value: controller.isDarkMode,
                      onChanged: (bool value) {
                        controller.change(value);
                        ThemeServices().switchTheme();
                      },
                    )),
              ],
            ),
            custom_button(
              onPressed:(){
                Get.to(loginscreen());
              },
              child: custom_text(text:'Login',style: titlestyle,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
