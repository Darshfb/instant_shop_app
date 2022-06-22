import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/theme.dart';
import 'package:softagi/view/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class aboutus  extends StatelessWidget {
   Future<void>openlink(String link)async{
    var urlink=link;
    if(await canLaunch((urlink))){
      await launch (urlink);
    }
    else{
      await launch (urlink);

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   alignment: Alignment.topLeft,
                //   width: MediaQuery.of(context).size.width,
                //   child: IconButton(
                //     onPressed: (){
                //       Get.back();
                //     },
                //     icon: Icon(Icons.arrow_back_ios_outlined),
                //   ),
                // ),
                const SizedBox(height: 20,),
                custom_text(text: 'About US',style: subHeadingstyle,),
                const SizedBox(height: 20,),
                Text("We are a TeamWork that shared our flutter learning to perform this app with Getx stateManagement,  HTTP for Api requests and as we are  fresh flutter developers seeking a challenging and progressive''position to help us grow along with the company and gain knowledge and experience from it.".tr,style: headingstyle,),
                const SizedBox(height: 40,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage:AssetImage('assets/images/ahmed1.jpg') ,
                              ),
                              custom_text(text: 'Ahmed Abodev',style: titlestyle,),
                              IconButton(onPressed:(){
                                openlink('https://www.facebook.com/abodevahmed');
                              }
                              , icon: Icon(Icons.facebook))


                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage:AssetImage('assets/images/mostafa.jpg') ,
                              ),
                              custom_text(text: 'Mostafa Mahmoud',style: titlestyle,),
                              IconButton(onPressed: (){
                                openlink('https://www.facebook.com/Mr.mostafamahmod');
                              }, icon: Icon(Icons.facebook))

                            ],
                          ),
                        ),
                      ),

                    ],
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
