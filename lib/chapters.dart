import 'package:flutter/material.dart';
import 'contactUs.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:audioplayers/audio_cache.dart';
import 'package:language/Third_Page.dart';

class Chapters extends StatefulWidget {
  static const String id = 'Chapters';

  @override
  _ChaptersState createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  bool checkedValue1=false;
  bool checkedValue2=false;
  bool checkedValue3=false;
  bool checkedValue4=false;
  var _play="play";
  void playSound() {
    final player = AudioCache();
    if(_play=="play"){
      player.play('R1.aac');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xfffca080),
              Colors.white,
              Color(0xfffca080)
            ])),
        child: Container(
          child: Column(children: <Widget>[
            SizedBox(height: 50,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                FlatButton(
                  height: 20,
                  minWidth: 10,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 75,
                ),
                Text(
                  'INTRODUCTION',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                Container(
                  height: 400,
                  width: 350,
                  decoration: BoxDecoration(
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
                        color: Colors.white70,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xe6fffdfd),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text('Question 1',style: TextStyle(fontWeight: FontWeight.bold,fontSize:30 ),),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: deprecated_member_use
                          FlatButton(
                            onPressed: () {
                              playSound();
                              _play="pause";
                            },
                            child: Icon(
                              Icons.play_circle_filled_sharp,
                              color: Color(0xff3500D3),
                              size: 55,
                            ),
                          ),
                          Container(
                              height: 55,
                              child: Image.asset('images/music.png'),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Checkbox(
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            activeColor: Colors.teal.shade200,
                            checkColor: Colors.black87,
                            value: checkedValue1,
                            onChanged: (bool? value) {
                              setState(() {
                                checkedValue1 = value!;
                                checkedValue2 = false;
                                checkedValue3 = false;
                                checkedValue4 = false;
                              });
                            },
                          ),
                          Text('मेरा घर ईशान है।',style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Checkbox(
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            activeColor: Colors.teal.shade200,
                            checkColor: Colors.black87,
                            value: checkedValue2,
                            onChanged: (bool? value) {
                              setState(() {
                                checkedValue2 = value!;
                                checkedValue1 = false;
                                checkedValue3 = false;
                                checkedValue4 = false;
                              });
                            },
                          ),
                          Text('आपका नाम ईशान है।',style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Checkbox(
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            activeColor: Colors.teal.shade200,
                            checkColor: Colors.black87,
                            value: checkedValue3,
                            onChanged: (bool? value) {
                              setState(() {
                                checkedValue1 = false;
                                checkedValue2 = false;
                                checkedValue3 = value!;
                                checkedValue4 = false;
                              });
                            },
                          ),
                          Text('मेरी जगह ईशान है।',style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Checkbox(
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            activeColor: Colors.teal.shade200,
                            checkColor: Colors.black87,
                            value: checkedValue4,
                            onChanged: (bool? value) {
                              setState(() {
                                checkedValue1 = false;
                                checkedValue2 = false;
                                checkedValue3 = false;
                                checkedValue4 = value!;
                              });
                            },
                          ),
                          Text('मेरा नाम ईशान है।',style: TextStyle(fontSize: 20),)
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 125,
                      decoration: BoxDecoration(
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
                            color: Colors.white70,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xe6fffdfd),
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: (){
                          Navigator.pushNamed(context, DashBoard.id);
                        },
                        child: Center(
                          child: Text(
                            'Prev',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      height: 40,
                      width: 125,
                      decoration: BoxDecoration(
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
                            color: Colors.white70,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xe6fffdfd),
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: (){
                          if(checkedValue4==true){
                            Navigator.pushNamed(context, Chapters.id);
                            return showAlertDialog(context);
                          }
                          else{
                            return showAlertDialog2(context);
                          }
                        },
                        child: Center(
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        height: 76,
        child: BottomNavigationBar(
          // selectedIconTheme: IconThemeData(color: Colors.),
            items: [
              BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: RaisedButton(
                  color: Colors.white,
                  elevation: 0,
                  onPressed: (){
                    Navigator.pushNamed(context, Contact.id);
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xff303C6C),
                    child: Icon(Icons.add_call, color: Colors.white),
                  ),
                ),
                // ignore: deprecated_member_use
                title: Text(
                  'Contact Us',
                  style: TextStyle(color: Color(0xff303C6C)),
                ),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: RaisedButton(
                  color: Colors.white,
                  elevation: 0,
                  onPressed: () {
                    Navigator.pushNamed(context, DashBoard.id);
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xff303C6C),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                title: Text(
                  'Home',
                  style: TextStyle(color: Color(0xff303C6C)),
                ),
                backgroundColor: Colors.white,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            iconSize: 35,
            elevation: 5),
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
    title: Text("Congrats!!!"),
    content: Text("Fantastic beginning..."),
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

showAlertDialog2(BuildContext context) {
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
    title: Text("Oops"),
    content: Text("Wrong Answer!!!"),
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