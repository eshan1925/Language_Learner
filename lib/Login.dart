import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:language/Third_Page.dart';
import 'package:language/finalsignup.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  static const String id = 'Login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _email, _password;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      // ignore: unnecessary_null_comparison
      if (user != null) {
        print(user.email);
        Navigator.pushReplacementNamed(context, "/");
      }
    });

    @override
    // ignore: unused_element
    void initState() {
      super.initState();
      this.checkAuthentication();
    }
  }

  login() async {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      try{
        // ignore: unused_local_variable
        UserCredential user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
        // ignore: unnecessary_null_comparison
        if(user != null){
          Navigator.pushReplacementNamed(context, DashBoard.id);
        }
      }
      catch(e){
        showError(e.toString());
        print(e);
      }
    }
  }

  showError(String errorMessage){
    showDialog(context: context, builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errorMessage),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
                child: Text('OK'),
              ),
            ],
          );
        }
    );
  }

  navigateToSignUp() async{
    Navigator.pushNamed(context, FinalSignup.id);
  }
  List values = [BoxFit.fitHeight,BoxFit.fitWidth,BoxFit.cover,BoxFit.contain];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color(0xfffca080)])),
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 100, 50, 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150,
                ),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'Please enter Email';
                              // ignore: unnecessary_statements
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            onSaved: (value) => _email = value,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.length < 6)
                                return 'Invalid Password';
                            },
                              decoration:
                              InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),),
                              obscureText:
                              true,
                              // ignore: unnecessary_statements
                              onSaved:
                              (value) => _password = value,
                          ),
                        ),
                        SizedBox(height
                        :40),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10,70, 10),
                            onPressed: login,
                        child:Text('Login',style: TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                            color: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                GestureDetector(
                  child: Text('Create an Account?',style: TextStyle(fontWeight:FontWeight.bold),),
                  onTap: navigateToSignUp,
                  // onTap: Navigator.pushNamed(context, routeName)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
