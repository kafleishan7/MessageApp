import 'package:ElevateTalk/showusers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Signup.dart';
import 'appbar.dart';

class SignIn extends StatefulWidget {
  @override
  static String fusername = _SignInState.signusername;
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  static String signusername = "";
  TextEditingController loginemailcontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();

  void signinuser(String email, String password) async {
    // notificationTapBackground('notificationResponse' as NotificationResponse);
    String Url =
        "https://elevatetalk.000webhostapp.com/friendstalk/sign_in.php";
    var data = {
      'email': email,
      'password': password,
    };
    var uri = Uri.parse(Url);
    // Starting Web API Call.
    try {
      var coderesponse = await http.post(uri, body: (data));
      if (coderesponse.body == '200') {
        signusername = email;
        Fluttertoast.showToast(msg: "Login in successfull");
        loginemailcontroller.clear();
        loginpasswordcontroller.clear();

         Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => ShowUsers(),
          ),
          (route) => false);
      } else {
        Fluttertoast.showToast(msg: "Email or password doesn't match");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Network Connection Error");
    }
  }



  
  

  //
  //Getting Server response into variable.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('SignIn'),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 400,
            width: 300,
            child: Column(children: [
              Icon(
                Icons.login,
                color: Color.fromARGB(255, 5, 135, 210),
                size: 100,
              ),
              textfieldtheme(loginemailcontroller, 'Enter your email',
                  'Enter your verified email', 'email'),
              SizedBox(
                height: 20,
              ),
              textfieldtheme(loginpasswordcontroller, 'Your password',
                  'Password', 'password'),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 172),
                child: InkWell(
                    hoverColor: Colors.red,
                    child: Container(
                      child: Text(
                        "forgot password?",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildforgotpopup(context),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                  height: 50,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 5, 135, 210),
                  ),
                  child: Center(
                      child: Text(
                    "Log In",
                    style: TextStyle(
                        color: Color.fromARGB(255, 246, 246, 247),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
                ),
                onTap: () {
                  signusername = loginemailcontroller.text.toString();
                  print(signusername);

                  String fpassword = loginpasswordcontroller.text.toString();
                  print(signusername);
                  print(fpassword);
                  if (signusername == "" && fpassword == "") {
                    Fluttertoast.showToast(
                        msg: "Please fill the Login and signup fields");
                    return;
                  }
                  if (signusername != "" && fpassword != "") {
                    signinuser(signusername, fpassword);
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),

              // InkWell(

              Container(
                child: Row(
                  children: [
                    Text(
                      "Don't have any account? ",
                      style: TextStyle(color: Color.fromARGB(255, 6, 6, 6)),
                    ),
                    InkWell(
                        child: Text(
                          " SignUp",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        })
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

}

Widget _buildforgotpopup(BuildContext context) {
  void changepassword(String email, String confirmpassword) async {
    String Url =
        "https://elevatetalk.000webhostapp.com/friendstalk/forgotpassword.php";

    // var url = 'https://flutter-examples.000webhostapp.com/register_user.php';

    // Store all data with Param Name.
    var data = {
      'email': email,
      'newpassword': confirmpassword,
    };

    var uri = Uri.parse(Url);

    // Starting Web API Call.
    var coderesponse = await http.post(uri, body: (data));

    // Getting Server response into variable.
    print(coderesponse.statusCode);
    if (coderesponse.statusCode == 200) {
      Fluttertoast.showToast(msg: "Successfully changed password");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignIn()));
    } else {
      Fluttertoast.showToast(msg: "Plese Check your email and enter valid OTP");
    }

    // return response.statusCode;
  }

  TextEditingController newpwcontroller = TextEditingController();
  TextEditingController confirmpwcontroller = TextEditingController();
  TextEditingController newemailcontroller = TextEditingController();

  final prefixiconpw = Icon(Icons.password, color: Colors.blue);

  return SingleChildScrollView(
      child: AlertDialog(
    icon: Icon(Icons.change_circle),
    title: SingleChildScrollView(
        child: Center(
            child: Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Change Password",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          TextField(
              controller: newemailcontroller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  hintText: 'Email ')),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: newpwcontroller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2)),
                prefixIcon: prefixiconpw,
                hintText: 'New Password'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
              controller: confirmpwcontroller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                  prefixIcon: prefixiconpw,
                  hintText: 'Confirm Password')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (newpwcontroller.text != confirmpwcontroller.text) {
                  Fluttertoast.showToast(msg: "Confirm password doesn't match");
                  return;
                }
                changepassword(newemailcontroller.text.toString(),
                    confirmpwcontroller.text.toString());
              },
              child: const Text("change"))
        ],

        // title: TextField(
        //   decoration: InputDecoration(
        //       fillColor: Colors.white,
        //       border: OutlineInputBorder(
        //           borderRadius: BorderRadius.all(Radius.circular(5)),
        //           borderSide: BorderSide(color: Colors.black, width: 2))),
      ),
    ))),
  ));
}
