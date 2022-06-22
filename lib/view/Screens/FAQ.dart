import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/FQAS.dart';

class faqscreen1 extends StatelessWidget {
  // final faqscontroller c = Get.put(faqscontroller());
  final GetxController d=Get.put(faqscontroller(),permanent: true);
  @override
  bool _customTileExpanded = false;

  Widget build(BuildContext context) {
    return  GetBuilder<faqscontroller>(
      init: faqscontroller(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.fqa.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ExpansionTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                controller.fqa[index].question.toString(),
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              children: [
                                Text(
                                  controller.fqa[index].answer.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
