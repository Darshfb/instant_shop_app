import 'package:flutter/material.dart';

import '../const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  final Function() widget;

  HomePage(this.widget);
}

class _HomePageState extends State<HomePage> {
  // The indicator will show up when _isLoading = true.
  // The button will be unpressable, too.
  bool _isLoading = false;

  // This function will be triggered when the button is pressed
  void _startLoading() async {

    setState(() {
      _isLoading = true;
    });

    // Wait for 3 seconds
    // You can replace this with your own task like fetching data, proccessing images, etc
    await Future.delayed(Duration(seconds: 3)).then((value) async{

 await Future.value(widget.widget);


    } );

    setState(() {
      _isLoading = false;


    });
  }


@override

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: primaryColor,
        child: _isLoading
            ?const CircularProgressIndicator()
            : const Text(
          'Login',
          style: TextStyle(fontSize: 30),
        ) ,
        onPressed:widget.widget,
      ),
    );
  }
}
