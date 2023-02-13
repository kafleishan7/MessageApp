import 'package:flutter/material.dart';
import 'SignIn.dart';

void main() {
  // Main function to call first page as a Sign In.
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Chat App",
    home: SignIn(),
  ));
}
