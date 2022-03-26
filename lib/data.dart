// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  Data({Key? key}) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  final List dummyList = List.generate(10, (index) {
    return {
      "id": index,
      "title": "Name : $index",
      "subtitle": "Status : $index"
    };
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Data : ',
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
            child: ListView.builder(
              itemCount: dummyList.length,
              itemBuilder: (context, index) => Card(
                elevation: 6,
                margin: EdgeInsets.only(top: 3, bottom: 2),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(dummyList[index]["id"].toString()),
                    backgroundColor: Colors.pink.shade100,
                  ),
                  title: Text(dummyList[index]["title"]),
                  subtitle: Text(dummyList[index]["subtitle"]),
                ),
              ),
            )));
  }
}
