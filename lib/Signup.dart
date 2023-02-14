import 'package:ElevateTalk/appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'Home.dart';
import 'package:ElevateTalk/main.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false, title: "ElevateTalk", home: SignUp()));

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
  // static String Email = ;
}

class _SignUpState extends State<SignUp> {
  static String Email = '';

  void senddatatoserver(
      String name, String Email, String phonenumber, String Password) async {
    String Url =
        "https://elevatetalk.000webhostapp.com/friendstalk/signupdetail.php";

    // var url = 'https://flutter-examples.000webhostapp.com/register_user.php';

    // Store all data with Param Name.
    var data = {
      'name': name,
      'email': Email,
      'phonenumber': phonenumber,
      'password': Password
    };

    var uri = Uri.parse(Url);

    // Starting Web API Call.
    var response = await http.post(uri, body: (data));

    // Getting Server response into variable.
    print(response.statusCode);

    // return response.statusCode;
    if (response.statusCode == 500) {
      print(response.statusCode);
      Fluttertoast.showToast(msg: "Email is already registered");
    }

    if (response.statusCode == 200) {
      // emailcontroller.clear();
      // fullnamecontroller.clear();
      // phonenumbercontroller.clear();
      // passwordcontroller.clear();
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) => _buildPopupDialog(context),
      // );
      Fluttertoast.showToast(msg: "Check your email & verified your account");
    }
    print(response.body);
  }

  var veryfiacation = [
    '!',
    '@',
    '#',
    r'$',
    '%',
    '^',
    '*',
    '(',
    ')',
    '-',
    r'\',
    '+',
    '{',
    '}',
    ','
  ];
  final maincolor = Color.fromARGB(255, 5, 135, 210);

  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(fullnamecontroller);
    return Scaffold(
      appBar: appbar('SignUp'),
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          width: 360,
          height: 560,
          child: Container(
            width: 100,
            height: 20,
            color: Color.fromARGB(255, 227, 227, 227),
            child: Padding(
              padding: EdgeInsets.only(
                  top: (10), left: (0), right: (0), bottom: (0)),
              child: Column(
                children: [
                  Icon(
                    Icons.join_inner,
                    color: maincolor,
                    size: 70,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 30,
                        color: maincolor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: (5), left: 40, right: 40, bottom: 1),
                    child: textfieldtheme(fullnamecontroller, 'Your Name',
                        'Enter your name', 'name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: (20), left: 40, right: 40, bottom: 1),
                    child: textfieldtheme(
                        emailcontroller, 'Email', 'Your Email', 'email'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: (20), left: 40, right: 40, bottom: 1),
                    child: textfieldtheme(phonenumbercontroller, 'Phone number',
                        'Enter your phone number', 'number'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: (20), left: 40, right: 40, bottom: 1),
                    child: textfieldtheme(passwordcontroller, 'Your Password',
                        'Password', 'password'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: maincolor,
                      ),
                      child: Center(
                          child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                    ),
                    onTap: () {
                      String name = fullnamecontroller.text.toString();

                      Email = emailcontroller.text.toString();
                      String phonenumber =
                          phonenumbercontroller.text.toString();
                      String Password = passwordcontroller.text.toString();
                      String value = "";
                      String newval = "";
                      int checknumber = 100;

                      for (int i = 0; i < name.length; i++) {
                        String value = name[i];
                        for (int j = 0; j < veryfiacation.length; j++) {
                          String newval = veryfiacation[j];
                          if (value == newval || name.length < 5) {
                            checknumber = 200;
                            Fluttertoast.showToast(msg: "User name not valid");
                            return;
                          }
                        }
                      }
                      try {
                        int number = int.parse(phonenumber);
                        if (phonenumber.length < 10) {
                          Fluttertoast.showToast(
                              msg: "The phone number must have ten digits.");
                          return;
                        }
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: "Please Enter a valid phone number");
                      }
                      if (Password.length < 5) {
                        Fluttertoast.showToast(
                            msg: "Please enter a strength phone number");
                      }

                      if (checknumber != 200) {
                        if (name == "" ||
                            Email == "" ||
                            phonenumber == "" ||
                            Password == "") {
                          Fluttertoast.showToast(
                              msg: "Please fill the all fields");
                          return;
                        } else {
                          senddatatoserver(name, Email, phonenumber, Password);
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  // Verification Status check

  void verifyemail(String email, String code) async {
    String Url =
        "https://elevatetalk.000webhostapp.com/friendstalk/verificationcode.php";

    // var url = 'https://flutter-examples.000webhostapp.com/register_user.php';

    // Store all data with Param Name.
    var data = {
      'email': email,
      'code': code,
    };

    print(data);
    var uri = Uri.parse(Url);

    // Starting Web API Call.
    var coderesponse = await http.post(uri, body: (data));

    // Getting Server response into variable.
    print(coderesponse.statusCode);
    if (coderesponse.statusCode == 200) {
      Fluttertoast.showToast(msg: "Successfully user Verified");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignIn()));
      return;
    } else {
      Fluttertoast.showToast(msg: "Plese Check your email and enter valid OTP");
      return;
    }

    // return response.statusCode;
  }

  TextEditingController codecontroller = TextEditingController();
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: AlertDialog(
        title: TextField(
          controller: codecontroller,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              prefixIcon: Icon(
                Icons.verified_outlined,
                color: Colors.blue,
              ),
              hintText: 'Veryfication Code',
              hintStyle: TextStyle(color: Colors.grey)),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              print("This is signup state email");
              verifyemail(_SignUpState.Email, codecontroller.text.trim());
            },
            child: const Text('Verify'),
          ),
        ],
      ),
    ),
  );
}
