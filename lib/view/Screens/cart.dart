import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/add_or_remove%20_card_controller.dart';
import 'package:softagi/controller/card_data_contolloer.dart';
import 'package:softagi/controller/updatecard_controller.dart';
import 'package:softagi/model/cart_model.dart';
import 'package:softagi/theme.dart';
import 'package:softagi/view/widgets/custom_button.dart';
import 'package:softagi/view/widgets/custom_text.dart';

import '../../const.dart';
import 'Descrption.dart';
import 'checkout.dart';

void doNothing(BuildContext context) {}

void dosomting(BuildContext context) {}

class cartscreen extends StatefulWidget {
  @override

  _cartscreenState createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
final cartcontroller c=Get.put(cartcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:GetX<cartcontroller>(
        builder: ( controller) {
          items=controller.cartit.length;
          return controller.cartit.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_rounded,color: Colors.teal,size: 100,),
              custom_text(text: 'The Cart is Empty',style: subHeadingstyle,),
            ],
          ),
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(controller.cartit.length.obs.toString()),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.cartit.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(

                    // Specify a key if the Slidable is dismissible.
                      key: const ValueKey(0),

                      // The start action pane is the one at the left or the top side.
                      startActionPane: ActionPane(
                        extentRatio: 1.0,
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        // dismissible: DismissiblePane(
                        //     motion: Container(
                        //       alignment: Alignment.center,
                        //       width: MediaQuery.of(context).size.width,
                        //       color: Color(0xFFFE4A49),
                        //       child: Column(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.center,
                        //         crossAxisAlignment:
                        //             CrossAxisAlignment.center,
                        //         children: [
                        //           Icon(Icons.delete),
                        //           Text(
                        //             'Delete',
                        //             style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 20,
                        //                 fontWeight: FontWeight.bold),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     onDismissed: () {
                        //       addremovecard(
                        //           id: controller
                        //               .cartit[index].product!.id);
                        //     }
                        //     ),

                        // All actions are defined in the children parameter.
                        children: [
                          SlidableAction(
                            // An action can be bigger than the others.
                            onPressed: (context){
                              Get.to(descriptionScreen(
                                id: controller.cartit[index].product!.id,

                                name:controller.cartit[index].product!.name ,
                                title: controller.cartit[index].product!.name,
                                description: controller.cartit[index].product!.description.toString(),
                                image: controller.cartit[index].product!.image.toString(),
                                price: controller.cartit[index].product!.price.toString(),
                                oldPrice: controller.cartit[index].product!.old_price.toString(),

                              ));
                            },
                            backgroundColor: Color(0xFF7BC043),
                            foregroundColor: Colors.white,
                            icon: Icons.info_rounded,
                            label: 'details',
                          ),


                          // A SlidableAction can have an icon and/or a label.
                        ],
                      ),

                      // The end action pane is the one at the right or the bottom side.
                      endActionPane: ActionPane(
                        extentRatio: 1,
                        motion: ScrollMotion(),
                        children: [

                          SlidableAction(
                            onPressed: (context) {
                              addremovecard(
                                  id: controller.cartit[index].product!.id);
                              controller.delete(index);
                            },
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),

                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Card(
                          elevation: (Get.isDarkMode) ? 20 : 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: FadeInImage.assetNetwork(
                                      height: MediaQuery.of(context).size.height/6,
                                      fit: BoxFit.fill,
                                      placeholder:
                                      'assets/images/loding.gif',
                                      image: controller
                                          .cartit[index].product!.image
                                          .toString(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    flex: 7,
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            alignment: Alignment.topRight,
                                            child: custom_text(
                                              text:
                                              " ${controller.cartit[index].product!.name}",
                                              style: titlestyle,
                                            )),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            custom_text(
                                              text:
                                              " ${controller.cartit[index].product!.price.toString()}",
                                              style: newprice,
                                              max: 1,
                                            ),
                                            custom_text(
                                              text:
                                              " ${controller.cartit[index].product!.old_price.toString()}",
                                              style: oldprice,
                                              max: 1,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Card(
                                                elevation: 20,
                                                shape:
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        30)),
                                                color: Colors.deepOrange,
                                                child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        controller.cartit[index].quantity++;updatecard(quantity: controller.cartit[index].quantity,
                                                            id: controller.cartit[index].id);

                                                      });
                                                    },
                                                    icon:
                                                    Icon(Icons.add))),
                                            custom_text(
                                              text:
                                              " ${controller.cartit[index].quantity.toString()}",
                                              style: titlestyle,
                                              max: 1,
                                            ),
                                            Card(
                                                elevation: 20,
                                                shape:
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        30)),
                                                color: Colors.deepOrange,
                                                child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        controller.cartit[index].quantity--;
                                                        updatecard(quantity: controller.cartit[index].quantity, id: controller.cartit[index].id);
                                                        if(controller.cartit[index].quantity<1){
                                                          addremovecard(
                                                              id: controller.cartit[index].product!.id);
                                                          controller.delete(index);
                                                        }
                                                      });

                                                    },
                                                    icon: Icon(
                                                        Icons.remove))),
                                          ],
                                        ),
                                        // IconButton(onPressed: (){
                                        //   addremovecard(
                                        //       id: controller
                                        //           .cartit[index].product!.id);
                                        //   controller.delete(index);
                                        // }, icon: Icon(Icons.delete,color: Color(0xFFFE4A49),size: 30,)),

                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ));
                },
              ),
            ),
            // Container(
            //   color: Colors.grey,
            //   height: 50,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       custom_text(
            //         text: controller.totalitems().toString(),
            //         style: titlestyle,
            //       ),
            //       custom_text(
            //         text: 'Total',
            //         style: titlestyle,
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   color: Colors.grey,
            //   height: 50,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       custom_text(
            //         text: "${controller.cartit.length}",
            //         style: titlestyle,
            //       ),
            //       custom_text(
            //         text: 'item',
            //         style: titlestyle,
            //       ),
            //     ],
            //   ),
            // ),

            Container(
                alignment: Alignment.center,
                height: 50,
                child: MaterialButton(
                  color: Colors.deepOrange,
                  child: custom_text(
                    text: 'Proceed to checkout',
                    style: titlestyle,
                  ),
                  onPressed: () {
                    Get.to(checkout());
                  },
                )),
          ],
        );
      },)


    );
  }
}
