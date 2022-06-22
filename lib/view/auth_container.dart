import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/controller/forgetpassward_controller.dart';
import 'package:softagi/view/Screens/home_screen.dart';
import 'package:softagi/view/Screens/login_screen.dart';

import '../const.dart';
import 'Screens/MainScreen.dart';
import 'Screens/first screen.dart';

class aut_container extends StatefulWidget {
  @override
  State<aut_container> createState() => _aut_containerState();
}
class _aut_containerState extends State<aut_container> {
  String? token;
  bool? intial=true ;

  @override
  Widget build(BuildContext context) {

    if (intial!)
    {
      SharedPreferences.getInstance().then((value) {
        setState(()
        {
          intial = false;
          token = value.getString(keyAccessToken);
          print('toooooooooook $token');
        }
        );
      });
  return const Center(child:CircularProgressIndicator());
    }
    else{
      if (token == null)
      {
        return loginscreen();
      }
       else {
        return bottom_navigation_bar();
      }
    }


  }

}
