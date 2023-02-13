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

Widget textfieldtheme(TextEditingController controller, String labletext,
    String hintText, String type) {
  var obscuretext = false;
  final sufficicon;
  int changeicon = 0;

  if (type == 'email') {
    sufficicon = Icon(
      Icons.email,
    );
  } else if (type == 'name') {
    sufficicon = Icon(
      Icons.person_2,
    );
  } else if (type == 'number') {
    sufficicon = Icon(
      Icons.call,
    );
  } else if (type == 'password') {
    obscuretext = true;
    sufficicon = InkWell(
      child: IconButton(
        icon: Icon(obscuretext ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          setState(() {
            obscuretext = !obscuretext;
            print(obscuretext);
          });
        },
      ),
    );
    // sufficicon = Icon(Icons.hide_source);
  } else {
    sufficicon = Icon(Icons.abc);
  }

  final textfieldtheme = TextFormField(
    obscureText: obscuretext,
    controller: controller,
    cursorHeight: 4,
    style: TextStyle(fontSize: 15),
    decoration: InputDecoration(
        label: Text(
          labletext,
        ),
        suffixIcon: sufficicon,
        contentPadding: EdgeInsets.all(5),
        hintText: hintText,
        border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(Radius.circular(10)))),
  );

  return textfieldtheme;
}

void setState(Null Function() param0) {
  setState(() {});
}
