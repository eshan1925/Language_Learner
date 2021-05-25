import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  static const String id = 'ContactUs';
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color(0xfffca080)])),
      ),
    );
  }
}
