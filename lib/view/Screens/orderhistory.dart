import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/canceloder.dart';
import 'package:softagi/controller/getorders.dart';
import 'package:softagi/theme.dart';
import 'package:softagi/view/widgets/custom_button.dart';
import 'package:softagi/view/widgets/custom_text.dart';

class orderhistory extends StatelessWidget {
final GetxController c=Get.put(getordercontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<getordercontroller>(
        init: getordercontroller(),
        builder: ( controller) {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: controller.order.length,
          itemBuilder: (
            BuildContext context, int index) {
          var x = controller.order[index];

          return Card(
            child: ListTile(

              title:custom_text(text: x.date.toString(),style: titlestyle,),
              subtitle: Container(
                width: 10,

                child: IconButton(onPressed: (){
                  cancelorder(id: x.id!);
                  controller.clear(index);

                },
                icon: Icon(Icons.delete,color: Color(0xFFFE4A49),),
                ),
              ),

              leading: custom_text(text: x.status.toString(),style: titlestyle,),
              trailing: custom_text(text:'Total:  '+x.total.toInt().toString(),style: titlestyle,),
            ),
          );
        },);
      },),
    );
  }
}
