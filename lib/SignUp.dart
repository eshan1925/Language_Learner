import 'package:flutter/material.dart';
import 'startup.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';


class SignUp extends StatefulWidget {
  static const String id = 'SignUp_screen';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _email, _password, _name;

  checkAuthentication() async{
    _auth.authStateChanges().listen((user) async{
      // ignore: unnecessary_null_comparison
      if(user!=null){
        Navigator.pushNamed(context, Start.id);
      }
    });
  }

  @override
  void initState(){
    super.initState();
    this.checkAuthentication();
  }

  signUp() async{
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();

      try{
        // ignore: unused_local_variable
        UserCredential user = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
        // ignore: unnecessary_null_comparison
        if(user != null){
          await _auth.currentUser!.updateProfile(displayName: _name);
        }
      }
      catch(e){
        showError(e.toString());
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xfffca080),Colors.white, Color(0xfffca080)])),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(27, 100, 100, 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
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
                                return 'Please enter Name';
                              // ignore: unnecessary_statements
                            },
                            decoration: InputDecoration(
                              labelText: 'name',
                              prefixIcon: Icon(Icons.person),
                            ),
                            onSaved: (value) => _name = value,
                          ),
                        ),
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
                              if (value!.length < 6)
                                return 'Provide minimum 6 characters';
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
                            :20),
                        // ignore: deprecated_member_use
                        RaisedButton(
                            padding: EdgeInsets.fromLTRB(70, 10,70, 10),
                            onPressed: signUp,
                            child:Text('Sign-Up',style: TextStyle(
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
                // ignore: deprecated_member_use
                // RaisedButton(
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
