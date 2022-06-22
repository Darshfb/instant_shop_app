import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:softagi/controller/add_favort.dart';
import 'package:softagi/controller/home_data_controller.dart';

class favoicon1 extends StatefulWidget {
  _favoiconState createState() => _favoiconState();
  int id;


  favoicon1({
    required this.id,
  });
}

class _favoiconState extends State<favoicon1> {
  final GetxController c=Get.put(homedatacontroller());

  @override

  Widget build(BuildContext context) {
    return GetBuilder<homedatacontroller>(
      init: homedatacontroller(),
      builder: ( controller) {
        return Animator<double>(
          duration:  Duration(milliseconds: 1000),
          cycles: 0,
          curve: Curves.easeInOut,
          tween: Tween<double>(
              begin: 20.0,end: 25.0
          ),
          builder: (BuildContext context, AnimatorState<dynamic> animatorState, Widget? child) {
            return   IconButton(onPressed: (){
              setState(() {
                addfavort(id:widget.id );


              });
            }, icon: Icon(Icons.favorite_border_outlined,color:Colors.black,size: animatorState.value,),);

          },);
      },);

  }
}
