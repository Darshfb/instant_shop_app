import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/categories_controller.dart';
import 'package:softagi/theme.dart';
import 'package:softagi/view/widgets/custom_text.dart';

class categories extends StatelessWidget {
final GetxController c =Get.put(categoriescontroller(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<categoriescontroller>(
      init:categoriescontroller() ,
      builder: ( controller) {
     return   Container(
       margin: EdgeInsets.only(top: 60),

       child: GridView.builder(
         itemCount: controller.category.length,
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ), itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image:NetworkImage('${controller.category[index].image}'),
                      fit: BoxFit.cover
                    )
                    ),
                  child: Card(
                    color: Colors.deepOrange,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${controller.category[index].name}',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
                    ),
                  ),
                  ),
                ),
            );

          },

          ),
     );
      },);
  }
}
