import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class custom_text extends StatelessWidget {
  String text;
  TextAlign? textAlign;
  TextStyle? style;
  int? max;
  custom_text({this.style,this.textAlign,required this.text,this.max});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text.tr, style: style,
      textAlign: textAlign ,
        maxLines: max,
        overflow: TextOverflow.ellipsis,

      ),

    );
  }
}
