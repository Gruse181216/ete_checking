// ignore_for_file: unused_import, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors

import 'package:ete_checking/data.dart';
import 'package:ete_checking/door_room01.dart';
import 'package:ete_checking/personnel.dart';
import 'package:ete_checking/selectdoor.dart';
import 'package:flutter/material.dart';

import 'register.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        return Door();
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
                    child: Text("Data",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return selectdoor();
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
                    child: Text("Scan",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return personnel();
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
                    child: Text("Pesonnel",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Register();
                        }),
                      );
                    },
                    child: Text("Register",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                SizedBox(
                  height: 40,
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
