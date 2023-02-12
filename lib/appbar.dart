import 'package:flutter/material.dart';

appbar(String pagename) {
  int left = 0;
  int right = 0;
  int top = 0;
  int bottom = 0;
  if (pagename == 'SignIn') {
    left = 100;
  } else {
    left = 50;
  }

  final ishan = AppBar(
      backgroundColor: Color.fromARGB(255, 5, 135, 210),
      shadowColor: Colors.red,
      title: Padding(
        padding: EdgeInsets.only(left: left.toDouble()),
        child: Text(
          "ElevateTalk",
          style: TextStyle(background: null, color: Colors.white),
        ),
      ));

  return ishan;
}

textfieldtheme(
    TextEditingController controller, String labletext, String hintText) {
  final textfieldtheme = TextFormField(
    controller: controller,
    cursorHeight: 4,
    style: TextStyle(fontSize: 15),
    decoration: InputDecoration(
        label: Text(
          labletext,
        ),
        contentPadding: EdgeInsets.all(5),
        hintText: hintText,
        border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(Radius.circular(10)))),
  );

  return textfieldtheme;
}
