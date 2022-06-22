import 'package:animator/animator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/add_favort.dart';
import 'package:softagi/controller/add_or_remove%20_card_controller.dart';
import 'package:softagi/controller/card_data_contolloer.dart';
import 'package:softagi/controller/categories_controller.dart';
import 'package:softagi/controller/home_data_controller.dart';
import 'package:softagi/theme.dart';
import 'package:softagi/view/Screens/Descrption.dart';
import 'package:softagi/view/widgets/custom_text.dart';
import 'package:softagi/view/widgets/favoicon.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../const.dart';

class homeScreen extends StatelessWidget {
  final homedatacontroller c = Get.put(homedatacontroller());
  final cartcontroller cart = Get.put(cartcontroller());

  Color co=Colors.black;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<homedatacontroller>(

      init: homedatacontroller(),
      builder: ( controller) {
      return SafeArea(
        child:  SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          CarouselSlider.builder(
          itemCount:controller.banner.length ,
            options:CarouselOptions(
              height:200,
              viewportFraction:1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return (controller.banner.isEmpty)?Center(child: CircularProgressIndicator(
                color: Colors.blue,
              ),):FadeInImage.assetNetwork(
                placeholder: 'assets/images/loding.gif',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

                image: controller.banner[index].image.toString(),
              );
            },

          ),
           Container(
             padding: EdgeInsets.only(left: 15, right: 15),
               child: custom_text(text: 'Recently', style: heading1style)),
          StaggeredGridView.countBuilder(

            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      )
                  ),
                  color: Colors.grey[200],
                  elevation: 7,


                  child:  GestureDetector(

                    onTap: (){
                      Get.to(descriptionScreen(
                        id: controller.products[index].id,

                        name:controller.products[index].name ,
                        title: controller.products[index].name,
                        description: controller.products[index].description.toString(),
                        image: controller.products[index].image.toString(),
                        price: controller.products[index].price.toString(),
                        oldPrice: controller.products[index].old_price.toString(),

                      ));
                    },
                    child:
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Hero(tag: '${controller.products[index].name}',
                            child:FadeInImage.assetNetwork(
                              height: MediaQuery.of(context).size.height/6,
                              fit: BoxFit.contain,
                              placeholder: 'assets/images/loding.gif',
                              image: controller.products[index].image.toString(),
                            ), ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            child: Container(

                              child: Text('${controller.products[index].name}',style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(

                                      child: custom_text(style:oldprice, text: '${controller.products[index].old_price}', ),
                                    ),
                                    Container(

                                      child: custom_text(style:dis, text: '${controller.products[index].discount}%', ),
                                    ),
                                    Container(

                                      child: custom_text(style:newprice , text: '${controller.products[index].price}',),
                                    ),

                                  ],
                                ),

                      Animator<double>(
                        duration:  Duration(milliseconds: 1000),
                        cycles: 0,
                        curve: Curves.easeInOut,
                        tween: Tween<double>(
                            begin: 20.0,end: 25.0
                        ),
                        builder: (BuildContext context, AnimatorState<dynamic> animatorState, Widget? child) {
                          return   IconButton(onPressed: (){

                              addfavort(id:controller.products[index].id);
                              


                          }, icon: Icon(Icons.favorite_border_outlined,color:Colors.black,size: animatorState.value,),);

                        },),

                              ],
                            ),
                          ),
                      Container(

                        child:IconButton(onPressed: (){
                          addremovecard(id: controller.products[index].id);
                          cart.refrash();


                        },icon: Icon(Icons.shopping_cart_rounded,color: Colors.red[800],),iconSize: 30,)
                      ),

                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            staggeredTileBuilder: (int index)=> new StaggeredTile.fit(1),
          ),


            ],
          ),
        ),
      );
    },);
  }
}
