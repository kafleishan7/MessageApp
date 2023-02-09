// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:ElevateTalk/Home.dart';

// void main() {
//   runApp(MaterialApp(
//       debugShowCheckedModeBanner: false, title: "Todo App", home: SignIn()));
// }

// class SignIn extends StatefulWidget {
//   @override
//   static String fusername = _SignInState.signusername;
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   static String signusername = "";

//   TextEditingController loginemailcontroller = TextEditingController();
//   TextEditingController loginpasswordcontroller = TextEditingController();

//   signinuser(String username, String password) async {
//     //https://smartdustbiniotproject.000webhostapp.com/friendstalk/sign_up.php?username=sdfksjdf&pw=skdfjsdf

//     String ip = '192.168.1.72';
//     String url =
//         "https://smartdustbiniotproject.000webhostapp.com/friendstalk/sign_up.php?username=" +
//             (username.toString()) +
//             "&pw=" +
//             (password.toString());
//     var uri = Uri.parse(url);

//     print("Yes");
//     var response = await http.post(uri);
//     print('datasend succss');

//     setState(() {});
//     print(response.statusCode);

//     // fetchdata();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 54, 114, 244),
//           shadowColor: Colors.red,
//           title: Center(
//               child: Text(
//             "ElevateTalk",
//             style: TextStyle(
//                 background: null, color: Color.fromARGB(255, 255, 225, 0)),
//           )),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//               child: Container(
//             height: 400,
//             width: 300,
//             child: Column(
//               children: [
//                 Icon(
//                   Icons.login,
//                   size: 100,
//                 ),
//                 TextFormField(
//                   controller: loginemailcontroller,
//                   cursorHeight: 4,
//                   style: TextStyle(fontSize: 15),
//                   decoration: InputDecoration(
//                       label: Text(
//                         "Your Name",
//                       ),
//                       contentPadding: EdgeInsets.all(5),
//                       hintText: "Enter your name",
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(),
//                           borderRadius: BorderRadius.all(Radius.circular(10)))),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: loginpasswordcontroller,
//                   cursorHeight: 4,
//                   style: TextStyle(fontSize: 15),
//                   decoration: InputDecoration(
//                       label: Text(
//                         "Your Name",
//                       ),
//                       contentPadding: EdgeInsets.all(5),
//                       hintText: "Enter your name",
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(),
//                           borderRadius: BorderRadius.all(Radius.circular(10)))),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 InkWell(
//                   child: Container(
//                     height: 50,
//                     width: 90,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.red,
//                     ),
//                     child: Center(
//                         child: Text(
//                       "Log In",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15),
//                     )),
//                   ),
//                   onTap: () {
//                     setState(() {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => TODOAPP()));
//                       signusername = loginemailcontroller.text.toString();
//                       String fpassword =
//                           loginpasswordcontroller.text.toString();
//                       print(signusername);
//                       print(fpassword);
//                       if (signusername != "" && fpassword != "") {
//                         signinuser(signusername, fpassword);
//                       }
//                     });
//                   },
//                 )
//               ],
//             ),
//           )),
//         ));
//   }
// }
