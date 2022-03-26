// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, annotate_overrides, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors_in_immutables, override_on_non_overriding_member, avoid_print, deprecated_member_use

import 'dart:io';
import 'ipcon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController user_name = TextEditingController();
  TextEditingController user_studentid = TextEditingController();

  File? _images1;
  File? _images2;
  File? _images3;
  File? _images4;
  File? _images5;
  String? name, studentid;
  void register() async {
    final uri = Uri.parse("http://$ipcon/ete_php/insert_user.php");
    var request = http.MultipartRequest('POST', uri);
    var pic1 = await http.MultipartFile.fromPath("images1", _images1!.path);
    request.files.add(pic1);
    var pic2 = await http.MultipartFile.fromPath("images2", _images2!.path);
    request.files.add(pic2);
    var pic3 = await http.MultipartFile.fromPath("images3", _images3!.path);
    request.files.add(pic3);
    var pic4 = await http.MultipartFile.fromPath("images4", _images4!.path);
    request.files.add(pic4);
    var pic5 = await http.MultipartFile.fromPath("images5", _images5!.path);
    request.files.add(pic5);

    request.fields['user_name'] = user_name.text;
    request.fields['user_studentid'] = user_studentid.text;
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image Upload');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Register()));
    } else {
      print('Image Not Uploded');
      print(response.statusCode);
    }
  }

  void Getimage1(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(Icons.add),
    );
    setState(() {
      _images1 = File(image.path);
    });
  }

  void Getimage4(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(Icons.add),
    );
    setState(() {
      _images4 = File(image.path);
    });
  }

  void Getimage5(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(Icons.add),
    );
    setState(() {
      _images5 = File(image.path);
    });
  }

  void Getimage2(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(Icons.add),
    );
    setState(() {
      _images2 = File(image.path);
    });
  }

  void Getimage3(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(Icons.add),
    );
    setState(() {
      _images3 = File(image.path);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Sign in',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          color: Colors.amber.shade800,
          child: ListView(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 170),
                      child: Text(
                        'กรอกข้อมูลของท่าน ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, right: 40, bottom: 10, top: 10),
                              child: Container(
                                height: 50,
                                child: TextFormField(
                                  onChanged: (String string) {
                                    name = string.trim();
                                  },
                                  validator: RequiredValidator(
                                      errorText: 'กรุณากรอกให้ถูกต้อง'),
                                  controller: user_name,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'ชื่อ - นามสกุล',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, right: 40, top: 10, bottom: 10),
                              child: Container(
                                height: 50,
                                child: TextFormField(
                                  onChanged: (String string) {
                                    studentid = string.trim();
                                  },
                                  validator: RequiredValidator(
                                      errorText: 'กรุณากรอกให้ถูกต้อง'),
                                  controller: user_studentid,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'รหัสนักศึกษา',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'ถ่ายรูปหน้าตรง1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                },
                                child: Column(
                                  children: [
                                    Center(
                                      child: Stack(
                                        children: [
                                          _images1 == null
                                              ? Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 3,
                                                        color: Colors.black),
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        fit: BoxFit.none,
                                                        image: AssetImage(
                                                            "assets/Imgkaraoke/face.png")),
                                                  ),
                                                )
                                              : Container(
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage:
                                                        FileImage(_images1!),
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70)),
                                                ),
                                          Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 2,
                                                    ),
                                                    color: Colors.amber),
                                                child: IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  iconSize: 15,
                                                  icon: Icon(Icons.add),
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    Getimage1(
                                                        ImgSource.Gallery);
                                                  },
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'ถ่ายรูปหน้าตรง2',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                },
                                child: Column(
                                  children: [
                                    Center(
                                      child: Stack(
                                        children: [
                                          _images4 == null
                                              ? Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 3,
                                                        color: Colors.black),
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        fit: BoxFit.none,
                                                        image: AssetImage(
                                                            "assets/Imgkaraoke/face.png")),
                                                  ),
                                                )
                                              : Container(
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage:
                                                        FileImage(_images4!),
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70)),
                                                ),
                                          Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 2,
                                                    ),
                                                    color: Colors.amber),
                                                child: IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  iconSize: 15,
                                                  icon: Icon(Icons.add),
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    Getimage4(
                                                        ImgSource.Gallery);
                                                  },
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'ถ่ายรูปหน้าตรง3',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                },
                                child: Column(
                                  children: [
                                    Center(
                                      child: Stack(
                                        children: [
                                          _images5 == null
                                              ? Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 3,
                                                        color: Colors.black),
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        fit: BoxFit.none,
                                                        image: AssetImage(
                                                            "assets/Imgkaraoke/face.png")),
                                                  ),
                                                )
                                              : Container(
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage:
                                                        FileImage(_images5!),
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70)),
                                                ),
                                          Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 2,
                                                    ),
                                                    color: Colors.amber),
                                                child: IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  iconSize: 15,
                                                  icon: Icon(Icons.add),
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    Getimage5(
                                                        ImgSource.Gallery);
                                                  },
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'ถ่ายรูปหน้าด้านซ้าย',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                },
                                child: Column(
                                  children: [
                                    Center(
                                      child: Stack(
                                        children: [
                                          _images2 == null
                                              ? Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 3,
                                                        color: Colors.black),
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        fit: BoxFit.none,
                                                        image: AssetImage(
                                                            "assets/Imgkaraoke/face.png")),
                                                  ),
                                                )
                                              : Container(
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage:
                                                        FileImage(_images2!),
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70)),
                                                ),
                                          Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 2,
                                                    ),
                                                    color: Colors.amber),
                                                child: IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  iconSize: 15,
                                                  icon: Icon(Icons.add),
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    Getimage2(
                                                        ImgSource.Gallery);
                                                  },
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'ถ่ายรูปหน้าด้านขวา',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              padding:
                                  EdgeInsets.only(left: 15, top: 10, right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                },
                                child: Column(
                                  children: [
                                    Center(
                                      child: Stack(
                                        children: [
                                          _images3 == null
                                              ? Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 3,
                                                        color: Colors.black),
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        fit: BoxFit.none,
                                                        image: AssetImage(
                                                            "assets/Imgkaraoke/face.png")),
                                                  ),
                                                )
                                              : Container(
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage:
                                                        FileImage(_images3!),
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70)),
                                                ),
                                          Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 2,
                                                    ),
                                                    color: Colors.amber),
                                                child: IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  iconSize: 15,
                                                  icon: Icon(Icons.add),
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    Getimage3(
                                                        ImgSource.Gallery);
                                                  },
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              height: 50,
                              width: 150,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                        color: Colors.amber)), // background
                                textColor: Colors.white, // foreground
                                onPressed: () {
                                  setState(() {
                                    if (name == null || studentid == null) {
                                      ArtSweetAlert.show(
                                          context: context,
                                          artDialogArgs: ArtDialogArgs(
                                            type: ArtSweetAlertType.danger,
                                            title: "กรุณากรอกข้อมูลให้ครบ!!!",
                                          ));
                                    } else if (_images1 == null ||
                                        _images2 == null ||
                                        _images3 == null) {
                                      ArtSweetAlert.show(
                                          context: context,
                                          artDialogArgs: ArtDialogArgs(
                                            type: ArtSweetAlertType.danger,
                                            title:
                                                "กรุณาถ่ายภาพหน้าของท่านให้ครบ!!!",
                                          ));
                                    } else {
                                      register();
                                    }
                                  });
                                },
                                color: Colors.white,
                                child: Text(
                                  'สมัคร',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
