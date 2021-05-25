// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:language/Login.dart';
import 'package:language/Profile.dart';
import 'package:language/Third_Page.dart';
import 'package:language/contactUs.dart';
import 'package:language/chapters.dart';
import 'package:language/startup.dart';
import 'Startup_Page.dart';
import 'Second_page.dart';
import 'Third_Page.dart';
import 'finalsignup.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Home(),
      initialRoute: Home.id,
      routes: <String,WidgetBuilder>{
        Home.id:(context)=> Home(),
        Course.id:(context)=> Course(),
        DashBoard.id:(context)=> DashBoard(),
        Profile.id:(context)=> Profile(),
        Contact.id:(context)=> Contact(),
        Chapters.id:(context)=> Chapters(),
        Start.id:(context)=>Start(),
        FinalSignup.id:(context)=> FinalSignup(),
        Login.id:(context)=> Login(),
      },
    );
  }
}


