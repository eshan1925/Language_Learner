import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'startup.dart';


// ignore: must_be_immutable
class Home extends StatefulWidget {
  static const String id = 'Startup_screen';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) => new Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Main.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(27, 100, 100, 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 150,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    elevation: 25,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),),
                    child: Text(
                      "Let's Go       ➜",
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, Start.id);
                      showSpinner=true;
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}