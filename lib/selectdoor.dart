// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_new, sized_box_for_whitespace, unused_import

import 'package:ete_checking/door_room01.dart';
import 'package:flutter/material.dart';

import 'door_screen/door1_screen.dart';

class selectdoor extends StatefulWidget {
  @override
  _selectdoorState createState() => _selectdoorState();
}

class _selectdoorState extends State<selectdoor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Scan  ',
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
        color: Colors.amber.shade800,
        child: ListView(
          children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 270,
                  width: 160,
                  child: Image.asset(
                    "assets/Imgkaraoke/iconn.png",
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Door1Screen();
                      }),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white, // background

                        borderRadius: BorderRadius.circular(10)),
                    child: Text("DOOR 1",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) {
                  //       return selectdoor();
                  //     }),
                  //   );
                  // },
                  child: Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white, // background
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("DOOR 2",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text("ETE Checking",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
