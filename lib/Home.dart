import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:ElevateTalk/main.dart' as SignIn;
// import 'package:flushbar/flushbar_helper.dart';

void main() => runApp(MaterialApp(title: "Todo App", home: TODOAPP()));

class TODOAPP extends StatefulWidget {
  @override
  State<TODOAPP> createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  TextEditingController messagesendcontroller = TextEditingController();
  senddata(String message) async {
    String date = DateTime.now().toIso8601String();

    String ip = '192.168.1.72';
    String url =
        "https://smartdustbiniotproject.000webhostapp.com/friendstalk/senddatatoserver.php?message=" +
            (message.toString()) +
            "&email=" +
            SignIn.SignIn.fusername +
            "&message_date_time=" +
            date;
    var uri = Uri.parse(url);
    print('datasend succss');
    var response = await http.post(uri);

    // print(response.statusCode);
    // fetchdata();
  }

  var listTodo = [];

  fetchdata() async {
    String url =
        "https://smartdustbiniotproject.000webhostapp.com/friendstalk/fetchdata.php";

    // String url = "http://" + ip + "/abledsys/return.php";
    var uri = Uri.parse(url);
    var response = await http.post(uri);

    listTodo = jsonDecode(response.body);

    listTodo = listTodo.reversed.toList();

    listTodo.add({
      'Id': "Ikdon",
      'username': 'Ishan kalfe ',
      'message': 'Hi ',
      'email': 'jpg',
      'verifystatus': 'nothing',
      'date': ''
    });

    listTodo = listTodo.reversed.toList();
    // messagesendcontroller.clear();
    setState(() {});

    // new Timer.periodic(oneSecond, (Timer t) => setState(() {}));
    return listTodo;
  }

  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            setState(() {});
          },
        ),
        backgroundColor: Color.fromARGB(255, 54, 114, 244),
        shadowColor: Colors.red,
        title: const Center(
          child: Padding(
              padding: EdgeInsets.only(right: 40),
              child: Text(
                "ElevateTalk",
                style: TextStyle(
                    background: null, color: Color.fromARGB(255, 255, 225, 0)),
              )),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: fetchdata(),
          builder: (context, snapshot) {
            if (listTodo != null) {
              return RefreshIndicator(
                  child: ListView.builder(
                    itemCount: listTodo.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                TextField(
                                    controller: messagesendcontroller,
                                    cursorHeight: 4,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your age ',
                                      contentPadding: EdgeInsets.all(5),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    ),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 10, 129, 226),
                                        fontSize: 20)),
                              ],
                            ));
                      }
                      return index == 0
                          ? Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  TextField(
                                      controller: messagesendcontroller,
                                      cursorHeight: 2,
                                      decoration: InputDecoration(
                                          hintText: 'Enter your message',
                                          contentPadding: EdgeInsets.all(5),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)))),
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 10, 129, 226),
                                          fontSize: 20)),
                                ],
                              ))
                          : index >= 0
                              ? Container(
                                  alignment: Alignment.bottomCenter,
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 189, 240, 68),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              " ${listTodo[index]['username']}",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 224, 6, 6)),

                                              // style: textSytle,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "" + listTodo[index]['message'],
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 15),
                                          textAlign: TextAlign.left,
                                        ),
                                      ])),
                                )
                              : Text("");
                    },
                    // physics: const AlwaysScrollableScrollPhysics(),
                  ),
                  onRefresh: () {
                    return Future.delayed(Duration(seconds: (2).toInt()), () {
                      setState(() {});
                    });
                  });
            } else {
              return const Text("Loading....");
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("username");
          print(SignIn.SignIn.fusername);
          String newmessagesend = messagesendcontroller.text.toString();
          if (newmessagesend == "") {
          } else {
            senddata(newmessagesend);
            setState(() {});
          }
        },
        child: Icon(Icons.send),
        backgroundColor: Color.fromARGB(255, 22, 161, 26),
      ),
    );
  }
}
