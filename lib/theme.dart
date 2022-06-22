import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);
class ThemeController extends GetxController {

  bool isDarkMode = true;
 void change(value){
   isDarkMode = value;
   update();
 }
  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeTheme(Themes.dark);
    } else {
      Get.changeTheme(Themes.light);
    }
    update();
  }
}

class Themes {
  static final light = ThemeData(
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        backgroundColor:Color(0xFFF5F6F9),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.blue,
          // navigation bar color
          statusBarColor: Colors.black, // status bar color
        ),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      elevation: 20,
      backgroundColor: Colors.white,
    ),

    primaryColor: primaryClr,
    scaffoldBackgroundColor:Color(0xFFF5F6F9) ,
    backgroundColor: Color(0xFFF5F6F9),
    brightness: Brightness.light,
    cardColor: Color(0xffD1D9D9),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.lato(
        textStyle:  TextStyle(
            color:Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
    )
  );
  static final dark = ThemeData(
    primarySwatch: Colors.deepOrange,
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff333739),
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Color(0xff333739),
        elevation: 0.0,
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(color: Colors.white)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      elevation: 20,
      backgroundColor: Color(0xff333739),
    ),
    scaffoldBackgroundColor:  Color(0xff333739),
    cardColor: Color(0xff2e4d60),
    primaryColor: darkGreyClr,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
      textTheme: TextTheme(
        bodyText1: GoogleFonts.lato(
          textStyle:  TextStyle(
              color:Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      )
  );





}
TextStyle get newprice {
  return GoogleFonts.lato(
    textStyle:  TextStyle(
        color:Get.isDarkMode?Colors.deepOrange:Colors.deepOrange,
        fontWeight: FontWeight.w900,
        fontSize: 18,


    ),
  );

}

TextStyle get oldprice {
  return GoogleFonts.lato(
    textStyle:  TextStyle(
        decoration: TextDecoration.lineThrough,
        color:Get.isDarkMode?Colors.grey:Colors.grey,
        fontWeight: FontWeight.bold,
      fontSize: 18,

    ),
  );

}
TextStyle get dis {
  return GoogleFonts.lato(
    textStyle:  TextStyle(
      color:Get.isDarkMode?Colors.blueGrey:Colors.blueGrey,
      fontWeight: FontWeight.bold,
      fontSize: 18,

    ),
  );

}

TextStyle get headingstyle {
  return GoogleFonts.lato(
    textStyle:  TextStyle(
        color:Get.isDarkMode?Colors.white:Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold
    ),
  );

}
TextStyle get heading1style {
  return GoogleFonts.lato(
    textStyle:  TextStyle(
        color:Get.isDarkMode?Colors.white:Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold
    ),
  );

}

TextStyle get subHeadingstyle {
  return GoogleFonts.lato(
    textStyle:  TextStyle(
        color:Get.isDarkMode?Colors.white:Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.bold
    ),
  );

}
TextStyle get titlestyle {
  return GoogleFonts.lato(
    textStyle:  TextStyle(

        color:Get.isDarkMode?Colors.white:Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
    ),
  );

}
TextStyle get cartstyle {
  return GoogleFonts.lato(
    textStyle:  TextStyle(

        color:Get.isDarkMode?Colors.red:Colors.red,
        fontSize: 18,
        fontWeight: FontWeight.bold
    ),
  );

}

TextStyle get subTitlestyle {
  return GoogleFonts.lato(
    textStyle:  TextStyle(
        color:Get.isDarkMode?Colors.white:Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400
    ),
  );

}
TextStyle get bodystyle {
  return GoogleFonts.lato(
    textStyle:  TextStyle(
        color:Get.isDarkMode?Colors.teal:Colors.teal,
        fontSize: 24,
        fontWeight: FontWeight.w900
    ),
  );

}
TextStyle get body2style {
  return GoogleFonts.lato(
    textStyle:  TextStyle(
        color:Get.isDarkMode?Colors.grey[200]:Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400
    ),
  );

}