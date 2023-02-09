import 'dart:async';

import 'package:ElevateTalk/showusers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:ElevateTalk/main.dart' as SignIn;
// import 'package:intl/intl.dart';

// import 'package:flushbar/flushbar_helper.dart';

void main() =>
    runApp(MaterialApp(title: "Personalchat App", home: PersonalchatAPP()));

class PersonalchatAPP extends StatefulWidget {
  @override
  State<PersonalchatAPP> createState() => _PersonalchatAPPState();
}

class _PersonalchatAPPState extends State<PersonalchatAPP> {
  TextEditingController messagesendcontroller = TextEditingController();

  senddata(String message) async {
    // String date = DateTime.now().toString();
    DateTime datetime = DateTime.now();
    String year = datetime.year.toString();
    String month = datetime.month.toString();
    String day = datetime.day.toString();
    String hour = datetime.hour.toString();
    String min = datetime.minute.toString();
    String sec = datetime.second.toString();
    String date =
        year + ":" + month + ":" + day + ":" + hour + ":" + min + ":" + sec;
    String url =
        "https://elevatetalk.000webhostapp.com/friendstalk/sendpersonalchat.php?message=" +
            (message.toString()) +
            "&email=" +
            SignIn.SignIn.fusername +
            "&message_date_time=" +
            date +
            "&toemail=" +
            ShowUsers.toemail;
    print(message.toString());
    print(SignIn.SignIn.fusername);
    print(date);
    print(ShowUsers.toemail);
    var uri = Uri.parse(url);
    try {
      var response = await http.post(uri);
      print(response.body);

      listPersonalchat = jsonDecode(response.body);

      listPersonalchat = listPersonalchat.reversed.toList();

      listPersonalchat.add({
        'Id': "Ikdon",
        'username': 'Ishan kalfe ',
        'message': 'Hi ',
        'email': 'jpg',
        'verifystatus': 'nothing',
        'date': ''
      });

      listPersonalchat = listPersonalchat.reversed.toList();
      // messagesendcontroller.clear();
    } catch (e) {
      Fluttertoast.showToast(msg: "Network Connection Error.");
    }
    var response = await http.post(uri);

    // print(response.statusCode);
    // fetchdata();
  }

  var listPersonalchat = [];

  fetchdata() async {
    String url =
        "https://elevatetalk.000webhostapp.com/friendstalk/fetchpersonaldata.php?fromemail=" +
            SignIn.SignIn.fusername +
            "&toemail=" +
            ShowUsers.toemail;

    // String url = "http://" + ip + "/abledsys/return.php";
    var uri = Uri.parse(url);
    try {
      var response = await http.post(uri);
      listPersonalchat = jsonDecode(response.body);

      listPersonalchat = listPersonalchat.reversed.toList();

      listPersonalchat.add({
        'Id': "Ikdon",
        'username': 'Ishan kalfe ',
        'message': 'Hi ',
        'email': 'jpg',
        'verifystatus': 'nothing',
        'date': ''
      });

      listPersonalchat = listPersonalchat.reversed.toList();
      // messagesendcontroller.clear();
    } catch (e) {
      Fluttertoast.showToast(msg: "Network Connection Error..");
    }

    // new Timer.periodic(oneSecond, (Timer t) => setState(() {}));
    return listPersonalchat;
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
            if (listPersonalchat != null) {
              return RefreshIndicator(
                  child: ListView.builder(
                    itemCount: listPersonalchat.length,
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
                                              " ${listPersonalchat[index]['username']}",
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
                                          "" +
                                              listPersonalchat[index]
                                                  ['message'],
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
          print(ShowUsers.toemail);
          print(SignIn.SignIn.fusername);
        },
        child: Icon(Icons.send),
        backgroundColor: Color.fromARGB(255, 22, 161, 26),
      ),
    );
  }
}
