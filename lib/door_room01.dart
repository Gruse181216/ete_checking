// ignore_for_file: use_key_in_widget_constructors, override_on_non_overriding_member, annotate_overrides, sized_box_for_whitespace
  // ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Door extends StatefulWidget {
  @override
  _DoorState createState() => _DoorState();
}

class _DoorState extends State<Door> {
  @override
  final List dummyList = List.generate(10, (index) {
    return {
      "leading": "Name : $index",
      "title": "Status : $index",
      "subtitle": "Check In : $index"
    };
  });

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
          
            title: Text(
              'DATA',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true),
        body: Container(
          color: Colors.amber.shade800,
          height: double.infinity,
          width: double.infinity,
          child: Column(children: [
            Container(
              height: 350,
              width: 230,
              child: Image.asset(
                "assets/Imgkaraoke/iconn.png",
                color: Colors.black,
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 210,
                  top: 10,
                  bottom: 10,
                ),
                child: Text('Name :'),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 210,
                  top: 10,
                  bottom: 10,
                ),
                child: Text('Status :'),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 197,
                  top: 10,
                  bottom: 10,
                ),
                child: Text('Check In :'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 60,
                width: 60,
                child: Image.asset("assets/Imgkaraoke/true.png"),
              ),
            ),
          ]),
        ));
  }
}
