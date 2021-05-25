import 'package:flutter/material.dart';
import 'package:language/Third_Page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Course extends StatefulWidget {
  static const String id = 'Second_screen';
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  late String _value1;
  final List<String> nameList = <String>[
    "Please choose a Language",
    "English",
    "Hindi",
    "Tamil",
    "Telugu",
    "Punjabi",
    "Urdu",
    "Kannada",
    "Gujarati",
    "Marwadi",
    "Bihari",
    "Bengali",
    "Marathi",
  ];
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();
    _value1 = nameList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffe76c39),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Startup Page 3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(27, 100, 40, 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                    ),
                    // ignore: deprecated_member_use
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: DropdownButton(
                          value: _value1,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                          underline: SizedBox(
                            height: 1,
                          ),
                          iconEnabledColor: Colors.black,
                          iconSize: 35,
                          elevation: 15,
                          items: nameList.map(
                            (item) {
                              return DropdownMenuItem(
                                value: item,
                                child: new Text(item),
                              );
                            },
                          ).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _value1 = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 60,),
                    // ignore: deprecated_member_use
                    Hero(
                      tag: 'First',
                      child: Center(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                            elevation: 50,
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),),
                            child: Text(
                              ">",
                              style: TextStyle(fontSize: 30),
                            ),
                            onPressed: (){
                              if(_value1=="Please choose a Language"){
                                return showAlertDialog(context);
                              }
                              else{
                                Navigator.pushNamed(context, DashBoard.id);
                                showSpinner=true;
                              }
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



showAlertDialog(BuildContext context) {
  // Create button
  // ignore: deprecated_member_use
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("No Language Selected!!!"),
    content: Text("Please select a language to continue..."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}