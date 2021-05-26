import 'package:flutter/material.dart';
import 'package:language/Login.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_signin_button/flutter_signin_button.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_sign_in/google_sign_in.dart';
import 'package:language/Second_page.dart';
import 'package:language/Third_Page.dart';
import 'package:language/finalsignup.dart';


class Start extends StatefulWidget {
  static const String id = 'Start_screen';
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  bool showSpinner = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    // ignore: unnecessary_null_comparison
    if (googleUser != null) {

      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
        await _auth.signInWithCredential(credential);

        await Navigator.pushReplacementNamed(context, Course.id);

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  navigateToSignUp() async{
    Navigator.pushReplacementNamed(context, FinalSignup.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Main.png"),
          fit: BoxFit.cover,
        ),
      ),
      child:SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 40, 80, 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // SizedBox(
              //   height: 50,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 111,
                    child:
                    // ignore: deprecated_member_use
                    RaisedButton(
                        elevation: 12,
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),),
                        child: Text(
                          "Log-In",
                          style: TextStyle(fontSize: 25),
                        ),
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, Login.id);
                          showSpinner=true;
                        }
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width:111,
                    child:
                    // ignore: deprecated_member_use
                    RaisedButton(
                        elevation: 12,
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),),
                        child: Text(
                          "Sign-Up",
                          style: TextStyle(fontSize: 25),
                        ),
                        onPressed:
                          navigateToSignUp,
                    ),
                  ),
                ],),
              SizedBox(height: 25,),
              Container(
                child: SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: googleSignIn,
                ),
              ),
            ],
          ),
        ),
      ),
    ),);
  }
}
