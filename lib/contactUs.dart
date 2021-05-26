import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                colors: [Color(0xfffca080),Colors.white, Color(0xfffca080)])),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Image(image:AssetImage("images/app.png"),height: 180,width: 300,),
              RichText(
                text: TextSpan(
                  text: 'Contact Us',
                  style: TextStyle(
                    color: Color(0xFFF5813C),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height:25),
              new ElevatedButton(
                onPressed: () => launch("tel:+91 XXXXXXXXXX"),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Icon(
                    Icons.phone,
                    size: 30,
                    color: Color(0xfff18f6f),
                  ),
                  title: Text(
                    "+91 XXXXXXXXXX",
                    style: TextStyle(
                      color: Color(0xfff18f6f),
                      fontSize: 23.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height:25),
              new ElevatedButton(
                onPressed: () => launch("mailto: Languageocity@gmail.com"),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Icon(
                    Icons.mail,
                    size: 30,
                    color: Color(0xfff18f6f),
                  ),
                  title: Text(
                    "Languageocity@gmail.com",
                    style: TextStyle(
                      color: Color(0xfff18f6f),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height:25),
              new ElevatedButton(
                onPressed: () => launch("www.laguageocity.com"),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Icon(
                    Icons.link,
                    size: 30,
                    color: Color(0xfff18f6f),
                  ),
                  title: Text(
                    "Languageocity.com",
                    style: TextStyle(
                      color: Color(0xfff18f6f),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
