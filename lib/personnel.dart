// ignore_for_file: unnecessary_brace_in_string_interps, use_key_in_widget_constructors, camel_case_types, unnecessary_null_comparison, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ipcon.dart';
import 'dart:io';

class personnel extends StatefulWidget {
  @override
  _personnelState createState() => _personnelState();
}

class _personnelState extends State<personnel> {
  //ฟังก์ชันไว้เรียกข้อมูลของผู้ใช้งาน
  Future<List> getdata() async {
    if (Searchfield.text == "" || Searchfield.text == null) {
      // ถ้า Searchfield เท่ากับค่าว่างให้ เรียกข้อมูลมาแสดงทุกคน
      final response =
          await http.get(Uri.parse("http://$ipcon/ete_php/getuser.php"));
      var data = json.decode(response.body);
      //setState(() {});
      return data;
    } else {
      // ถ้า Searchfield ไม่เท่ากับค่าว่างให้ เรียกข้อมูลเฉพาะที่มีตัวอักษรนั้นๆอยู่ในชื่อ
      final response = await http.get(Uri.parse(
          "http://${ipcon}//ete_php/getuser.php?search=${Searchfield.text}")); //คือการส่งค่า Searchfield ไปค้นหาแล้วดึงข้อมูล
      var data = json.decode(response.body);
      setState(() {});
      return data;
    }
  }

  TextEditingController Searchfield =
      TextEditingController(); //กำหนดตัวรับช่องกรอกค้นหา ชื้อ Searchfield
  String search = ""; //กำหนด search ให้เท่ากับค่าว่าง

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วนแทบบาข้างบน
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("Personnel"),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              color: Colors.black54,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: TextField(
                      // ช่องกรอกเพื่อค้นหา
                      controller:
                          Searchfield, //กำหนดให้ค่าที่พิมมาอยู่ในตัวแปรชื่อ Searchfield
                      onChanged: (v) {
                        setState(() {
                          search = v;
                        });
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 14.0),
                          hintText: "Search",
                          suffixIcon: Material(
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(0.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                ),
                                color: Colors.black,
                                onPressed: () {},
                              )),
                          border: InputBorder.none
                          // prefixIcon: Icon(Icons.search),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              //color: Colors.red,
              child: FutureBuilder(
                future: getdata(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? Itemlist(list: snapshot.data)
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Itemlist extends StatefulWidget {
  final list;
  Itemlist({this.list});

  @override
  _ItemlistState createState() => _ItemlistState();
}

class _ItemlistState extends State<Itemlist> {
  File? _images;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list == null ? 0 : widget.list.length,
      itemBuilder: (context, i) {
        return Container(
          //ปรับความสูงการ์ด
          height: 100,
          child: Padding(
            padding: EdgeInsets.only(left: 10, bottom: 0, right: 10, top: 15),
            child: Card(
              child: ListTile(
                trailing: Wrap(
                  children: [
                    Column(
                      children: [
                        _images == null
                            ? Container(
                                //ปรับขนาดรูป
                                width: 70, //กว่าง
                                height: 70, //สูง
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'http://$ipcon/ete_php/upload/${widget.list[i]['user_img1']}'),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 50,
                                height: 50,
                              ),
                      ],
                    ),
                  ],
                ),
                title: Text('Name: ' +
                    widget.list[i]['user_name'] +
                    "\n" +
                    '\n Status: ' +
                    widget.list[i]['usertype_name']),
                // trailing: Wrap(
                // children: [
                // Column(
                // children: [
                // _images == null
                // ? Container(
                // ปรับขนาดรูป
                // width: 70, //กว่าง
                // height: 70, //สูง
                // decoration: BoxDecoration(
                // image: DecorationImage(
                // fit: BoxFit.cover,
                // image: NetworkImage(
                // 'http://$ipcon/ete_php/upload/${widget.list[i]['user_img1']}'),
                // ),
                // ),
                // )
                // : SizedBox(
                // width: 50,
                // height: 50,
                // ),
                // ],
                // ),
                // ],
                // ),
              ),
            ),
          ),
        );
      },
    );
  }
}
