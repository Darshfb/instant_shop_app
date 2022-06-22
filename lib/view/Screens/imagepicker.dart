import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

import '../../const.dart';

class CameraScreen extends StatefulWidget {

  @override
  _CameraScreenState createState() => _CameraScreenState();


}

class _CameraScreenState extends State<CameraScreen> {
  File? imageFile;
  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _getFromGallery();
                        Navigator.pop(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _getFromCamera();
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print("imageFile----------------------------->$imageFile");

        // List<int> imageBytes = imageFile.readAsBytesSync();
        // print(imageBytes);
        // base64Image = base64UrlEncode(imageBytes);
        List<int> imageBytes = imageFile!.readAsBytesSync();
        base64Image = base64Encode(imageBytes);
        print(" code=>>${imageBytes}");
        print(" code=>>${base64Image}");
        // updatimge(base64Image, id);
      });
    }
  }
  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        // print("imageFile----------------------------->$imageFile");
        // List<int> imageBytes = imageFile.readAsBytesSync();
        // print("dddd$imageBytes");
        // base64Image = base64UrlEncode(imageBytes);
        List<int> imageBytes = imageFile!.readAsBytesSync();
        base64Image = base64Encode(imageBytes);
        print(base64Image);

        // updatimge(base64Image, id);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [

        imageFile==null?Image.network('https://student.valuxapps.com/storage/assets/defaults/user.jpg'):Container(
          width: 200,
          height: 200,
          decoration:   BoxDecoration(
            color: const Color(0xff7c94b6),
            image:  DecorationImage(
              image:  FileImage(imageFile!),
              fit: BoxFit.cover,
            ),
            // border: Border.all(color: Colors.black, width: 0.05),
            borderRadius:
              BorderRadius.circular(20),
          ),
        ),
        IconButton(onPressed: (){
          _showSelectionDialog(context);

        }, icon:Icon(Icons.camera_enhance),
        )
      ],
    );
  }
}