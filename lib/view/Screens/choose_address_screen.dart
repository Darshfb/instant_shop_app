import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/address_controller.dart';
import 'package:softagi/theme.dart';
import 'package:softagi/view/widgets/custom_text.dart';

class ChooseAddressScreen extends StatelessWidget {
  final GetxController c = Get.put(AdressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<AdressController>(
        init: AdressController(),
        builder: (controller) {
          return Container(
            height:  MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: controller.title.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ExpansionTile(
                        iconColor: Colors.teal,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: ListTile(
                          title: Center(
                            child: custom_text(
                              text: 'Address $index',
                              style: titlestyle,
                            ),
                          ),
                        ),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  custom_text(text: 'phone'),
                                  SizedBox(width: 20,),
                                  custom_text(text: '${controller.title[index].name}')
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  custom_text(text: 'City'),
                                  SizedBox(width: 20,),
                                  custom_text(
                                      text: controller.title[index].city.toString()),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 2,
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  custom_text(text: 'region'),
                                  SizedBox(width: 20,),
                                  custom_text(
                                      text: '${controller.title[index].region}'),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  custom_text(text: 'note'),
                                  SizedBox(width: 20,),
                                  custom_text(
                                      text: '${controller.title[index].notes}')
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
