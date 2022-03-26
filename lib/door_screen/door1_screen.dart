// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_field, deprecated_member_use, avoid_unnecessary_containers
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

class Door1Screen extends StatefulWidget {
  Door1Screen({Key? key}) : super(key: key);

  @override
  State<Door1Screen> createState() => _Door1ScreenState();
}

class _Door1ScreenState extends State<Door1Screen> {
  File? _image;
  Future getImage(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(
        Icons.add,
        color: Colors.red,
      ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
    );
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Door113123123123  ',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.amber.shade800,
        child: Column(
          children: [
            Container(
                child: MaterialButton(
              onPressed: () => getImage(ImgSource.Camera),
              color: Colors.blue,
              child: Icon(Icons.add_a_photo, color: Colors.white, size: 60.0),
              padding: EdgeInsets.all(30),
              shape: CircleBorder(),
            )),
          ],
        ),
      ),
    );
  }
}
