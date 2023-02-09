import 'package:ElevateTalk/main.dart';
import 'package:ElevateTalk/main.dart';
import 'package:ElevateTalk/personalchat.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false, title: "Todo App", home: ShowUsers()));

class ShowUsers extends StatefulWidget {
  ShowUsers({super.key});

  @override
  State<ShowUsers> createState() => _ShowUsersState();
  static String toemail = 'jhjhkj';
}

class _ShowUsersState extends State<ShowUsers> {
  var listTodo = [];
  fetchdata() async {
    String url =
        "https://elevatetalk.000webhostapp.com/friendstalk/showusers.php";

    // String url = "http://" + ip + "/abledsys/return.php";
    var uri = Uri.parse(url);

    try {
      var response = await http.post(uri);
      listTodo = jsonDecode(response.body);
      listTodo = listTodo.reversed.toList();
      listTodo = listTodo.reversed.toList();
      // messagesendcontroller.clear();
      setState(() {});
    } catch (a) {
      Fluttertoast.showToast(msg: "Network Conncection Error");
    }
    return listTodo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with user"),
      ),
      body: FutureBuilder(
          future: fetchdata(),
          builder: (context, snapshot) {
            if (listTodo != null) {
              return RefreshIndicator(
                  child: ListView.builder(
                    itemCount: listTodo.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 219, 223, 211),
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
                                        size: 50,
                                      ),
                                      Text(
                                        " ${listTodo[index]['username']}",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 224, 6, 6)),

                                        // style: textSytle,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      //
                                      // Container(
                                      //     width: 100.0,
                                      //     height: 150.0,
                                      //      decoration: BoxDecoration(
                                      //      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      //     color: Colors.redAccent
                                      //     ,child: Image.asset(
                                      //       ('assets/message.png'),
                                      //       height: 150.0,
                                      //       width: 100.0,
                                      //     )),)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: InkWell(
                                          child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50.0)),
                                            ),
                                            child: Image.asset(
                                              ('assets/message.png'),
                                            ),
                                          ),
                                          onTap: () {
                                            print(listTodo[index]['email']);
                                            print(SignIn.fusername);
                                            ShowUsers.toemail =
                                                listTodo[index]['email'];

                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PersonalchatAPP()));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ]))),
                      );
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
    );
  }

  personalscaffold() {
    return RefreshIndicator(
        child: ListView.builder(
          itemCount: listTodo.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
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
                              size: 50,
                            ),
                            Text(
                              " ${listTodo[index]['username']}",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 224, 6, 6)),

                              // style: textSytle,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            //
                            // Container(
                            //     width: 100.0,
                            //     height: 150.0,
                            //      decoration: BoxDecoration(
                            //      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            //     color: Colors.redAccent
                            //     ,child: Image.asset(
                            //       ('assets/message.png'),
                            //       height: 150.0,
                            //       width: 100.0,
                            //     )),)
                            Padding(
                              padding: const EdgeInsets.only(left: 110),
                              child: InkWell(
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: Image.asset(
                                    ('assets/message.png'),
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ]))),
            );
          },
          // physics: const AlwaysScrollableScrollPhysics(),
        ),
        onRefresh: () {
          return Future.delayed(Duration(seconds: (2).toInt()), () {
            setState(() {});
          });
        });
  }
}
