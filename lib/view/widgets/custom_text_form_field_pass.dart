import 'package:flutter/material.dart';

class custom_text_form_field_pass extends StatefulWidget {
  String? hintText;
  //var validator;
  FormFieldValidator? validator;
  Function(String?)? onsaved;
  TextInputType? keyboardType;
  String? helperText;
  String? initialvalue;
  bool obscureText = false;
  Icon? icon;
  var Textinputaction;

  custom_text_form_field_pass(
      {this.hintText,
      this.validator,
      this.onsaved,
      this.keyboardType,
      this.helperText,
      this.icon,
      this.initialvalue,
      required this.obscureText,
      this.Textinputaction});

  @override
  _custom_text_form_field_passState createState() =>
      _custom_text_form_field_passState();
}

class _custom_text_form_field_passState
    extends State<custom_text_form_field_pass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: 15
      ),
      child: TextFormField(
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        onSaved: widget.onsaved,
        obscuringCharacter: '*',
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          isDense: true,
          fillColor: Colors.grey.shade400,
          hintText: widget.hintText,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  widget.obscureText = !widget.obscureText;
                });
              },
              icon: widget.obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off)),
          prefixIcon: widget.icon,
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.all(5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
        ),
      ),
    );
  }
}
