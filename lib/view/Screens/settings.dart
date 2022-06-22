import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/controller/AppLanguage/app_language.dart';
import 'package:softagi/controller/logout.dart';
import 'package:softagi/controller/profile_controller.dart';
import 'package:softagi/services/theme_services.dart';
import 'package:softagi/view/Screens/FAQ.dart';
import 'package:softagi/view/Screens/choose_address_screen.dart';
import 'package:softagi/view/Screens/splash%20screen.dart';
import 'package:softagi/view/Screens/update_profile.dart';
import 'package:softagi/view/widgets/custom_text.dart';
import 'package:softagi/view/widgets/test.dart';
import '../../const.dart';
import '../../controller/home_data_controller.dart';
import '../../theme.dart';
import 'about us.dart';
import 'add_address.dart';
import 'cart.dart';
import 'login_screen.dart';
import 'orderhistory.dart';

class settings extends StatelessWidget {
  final homedatacontroller home = Get.put(homedatacontroller());

  final ThemeController c = Get.put(ThemeController());
final AppLanguage l=Get.put(AppLanguage());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            custom_text(
              text: 'Settings',
              style: heading1style,
            ),
            const SizedBox(height: 20,),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: profileimage(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return (snapshot.data==null)?Center(
                      child: CircularProgressIndicator(),
                    ): CircleAvatar(
                      backgroundImage:
                      NetworkImage(snapshot.data.toString(),),


                      radius: 70,
                    );

                  },),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   FutureBuilder(
                     future: profilename(),
                     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                     return  (snapshot.data==null)?Center(
                       child: Text(''),
                     ):  custom_text(
                       text: snapshot.data.toString(),
                       style: headingstyle,
                       max: 1,
                     );
                   },),
                      FutureBuilder(
                        future: profileemail(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          return   (snapshot.data==null)?Center(
                            child: Text(''),
                          ): custom_text(
                            text: snapshot.data.toString(),
                            style: subTitlestyle,
                            max: 1,
                          );
                        },),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
            // GetBuilder<profilecontroller>(
            //   init: profilecontroller(),
            //   builder: (controller) {
            //     return Column(
            //       children: [
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             CircleAvatar(
            //               backgroundImage:
            //                   NetworkImage(controller.image.toString()),
            //               radius: 70,
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 custom_text(
            //                   text: controller.name.toString(),
            //                   style: headingstyle,
            //                   max: 1,
            //                 ),
            //                 custom_text(
            //                   text: controller.email.toString(),
            //                   style: subTitlestyle,
            //                   max: 1,
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ],
            //     );
            //   },
            // ),
            const SizedBox(height: 40,),

            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.brightness_6_sharp),
                  trailing: GetBuilder<ThemeController>(
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
                  title: custom_text(
                    text: 'Theme Mode',
                    style: titlestyle,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.brightness_6_sharp),
                  trailing: GetBuilder<AppLanguage>(
                      init: AppLanguage(),
                      builder: (controller) => DropdownButton(

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
                            onChanged: (value) async{
                              controller.changeLanguage('$value');
                              Get.updateLocale(Locale('$value')).then((value){
                                // Phoenix.rebirth(context);
                              });
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setString('lang2', value.toString());
                              home.reupdate();
                              // Get.off(SplashScreen());

                            },
                          )),
                  title: custom_text(
                    text: 'Language',
                    style: titlestyle,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(updateprofile());
                  },
                  child: ListTile(
                    leading: Icon(Icons.account_circle_rounded),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    title: custom_text(
                      text: 'Update Profile',
                      style: titlestyle,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Get.to(faqscreen1());
                  },
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    trailing: Icon(
                     Icons.arrow_forward_ios_outlined,
                    ),
                    title: custom_text(
                      text: 'FAQ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                ExpansionTile(

                  iconColor: Colors.teal,
                  leading: Icon(Icons.location_on_outlined,),
                  // trailing: Icon(
                  //   Icons.arrow_forward_ios_outlined,
                  // ),
                  title: ListTile(
                    title: custom_text(
                      text: 'Address',
                      style: titlestyle,
                    ),
                  ),

                  children: [
                    MaterialButton(
                      color: Colors.transparent,
                      elevation: 0,
                      onPressed: ()
                    {
                      Get.to(ChooseAddressScreen());
                    },
                    child:custom_text(
                      text: 'Your Address',
                    ),
                    ),
                    MaterialButton(
                      elevation: 0,
                      color: Colors.transparent,
                      onPressed: ()
                    {
                      Get.to(addAddressscreen());
                    },
                      child:custom_text(
                        text: 'Crerate Your Address',
                      ),
                    ),

                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(orderhistory());
                  },
                  child: ListTile(
                    leading: Icon(Icons.watch_later_outlined),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    title: custom_text(
                      text: 'Order History',
                      style: titlestyle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(aboutus());
                  },
                  child: ListTile(
                    leading: Icon(Icons.info_outline_rounded),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    title: custom_text(
                      text: 'About US',
                      style: titlestyle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    logout();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove(keyAccessToken);
                    Get.offAll(loginscreen());
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                    title: custom_text(
                      text: 'Log Out',
                      style: titlestyle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),

          ],
        ),
      ),
    );
  }
}
