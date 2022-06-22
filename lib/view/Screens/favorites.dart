import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/add_favort.dart';
import 'package:softagi/controller/add_or_remove%20_card_controller.dart';
import 'package:softagi/controller/getfavorit.dart';
import 'package:softagi/view/widgets/custom_text.dart';
import 'package:softagi/view/widgets/favoicon.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../theme.dart';
import 'Descrption.dart';

class favorites extends StatelessWidget {
  final GetxController c=Get.put(getfavort(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<getfavort>(
      init: getfavort(),
      builder: ( controller) {
      return     Container(
        height: MediaQuery.of(context).size.height,
        child: StaggeredGridView.countBuilder(
          physics: BouncingScrollPhysics(),
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
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    )
                ),
                color: Colors.grey[200],
                elevation: 7,


                child:  GestureDetector(

                  onTap: (){
                    Get.to(descriptionScreen(
                      id: controller.products[index].product!.id,
                      name:controller.products[index].product!.name ,
                      title: controller.products[index].product!.name,
                      description: controller.products[index].product!.description.toString(),
                      image: controller.products[index].product!.image.toString(),
                      price: controller.products[index].product!.price.toString(),
                      oldPrice: controller.products[index].product!.old_price.toString(),

                    ));
                  },
                  child:
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(tag: '${controller.products[index].product!.name}',
                          child:FadeInImage.assetNetwork(
                            height: MediaQuery.of(context).size.height/6,
                            fit: BoxFit.contain,
                            placeholder: 'assets/images/loding.gif',
                            image: controller.products[index].product!.image.toString(),
                          ), ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          child: Container(

                            child: Text('${controller.products[index].product!.name}',style: TextStyle(
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

                                    child: custom_text(style:newprice , text: '${controller.products[index].product!.price}',),
                                  ),
                                  Container(

                                    child: custom_text(style:oldprice, text: '${controller.products[index].product!.old_price}', ),
                                  ),
                                ],
                              ),
                              // IconButton(onPressed: (){
                              //   print('a5yaaaaaaaaaaaaa${controller.products[index].in_favorites}');
                              // },
                              //     icon:(controller.products[index].in_favorites)?Icon(Icons.two_mp_sharp):Icon(Icons.favorite_border_outlined)),
                    Animator<double>(
                      duration:  Duration(milliseconds: 1000),
                      cycles: 0,
                      curve: Curves.easeInOut,
                      tween: Tween<double>(
                          begin: 20.0,end: 25.0
                      ),
                      builder: (BuildContext context, AnimatorState<dynamic> animatorState, Widget? child) {
                        return   IconButton(onPressed: (){

                            addfavort(id:controller.products[index].product!.id);
                            controller.delete(index);


                        }, icon: Icon(Icons.favorite,color:Colors.red.withOpacity(1.0),size: animatorState.value,),color: Colors.red,);

                      },),                           // Animator<double>(
                              //   duration:  Duration(milliseconds: 1000),
                              //   cycles: 0,
                              //   curve: Curves.easeInOut,
                              //   tween: Tween<double>(
                              //       begin: 20.0,end: 25.0
                              //   ),
                              //   builder: (BuildContext context, AnimatorState<dynamic> animatorState, Widget? child) {
                              //     return   IconButton(onPressed: (){
                              //
                              //     }, icon: Icon(Icons.favorite_border_outlined,color:Colors.black,size: animatorState.value,),);
                              //
                              //   },),
                            ],
                          ),
                        ),
                        Container(

                          child: IconButton(onPressed: (){
                            addremovecard(id: controller.products[index].product!.id);

                          },icon: Icon(Icons.shopping_cart_rounded,color: Colors.red[800],),iconSize: 30,),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          staggeredTileBuilder: (int index)=> new StaggeredTile.fit(1),
        ),
      );
    },);
  }
}
