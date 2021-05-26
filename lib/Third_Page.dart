import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:language/Profile.dart';
import 'package:language/chapters.dart';
import 'package:language/contactUs.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:language/startup.dart';

class DashBoard extends StatefulWidget {
  static const String id = 'Third_screen';

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Color _bgColor1 = Colors.white;
  Color _bgColor2 = Colors.transparent;
  Color _bgColor3 = Colors.transparent;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isLoggedIn = false;
  checkAuthentication() async{
    _auth.authStateChanges().listen((user) {
      // ignore: unnecessary_null_comparison
      if(user == null){
        Navigator.pushNamed(context, Start.id);
      }
    });
  }

  getUser() async{
    User firebaseUser = _auth.currentUser!;
    await firebaseUser.reload();
    firebaseUser = _auth.currentUser!;

    setState(() {
      this.user = firebaseUser;
      this.isLoggedIn = true;
    });
  }

  @override
  // ignore: must_call_super
  void initState(){
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color(0xfffca080)])),
        child: !isLoggedIn? CircularProgressIndicator():
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
          child: Container(
            child: ListView(children: <Widget>[
              SizedBox(height: 15),
              Image(image:AssetImage("images/app.png"),height: 180,width: 300,),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 3.4, 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Profile.id);
                  },
                  child: Hero(
                    tag: 'profile_image',
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 40,
                      child: CircleAvatar(
                          backgroundImage: AssetImage("images/P1.png"),
                          radius: 38),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  'Namaste  ${user.displayName}🙏,',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Learn your favourite language here',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Center(
                child: Text(
                  'Completed - 40% of हिंदी',
                  style: TextStyle(color: Colors.black87, fontSize: 25),
                ),
              ),
              // Center(
              //   child: Text(
              //     '40%  of English',
              //     style: TextStyle(color: Colors.black, fontSize: 15),
              //   ),
              // ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // ignore: deprecated_member_use
                  Container(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            _bgColor1 = Colors.white;
                            _bgColor2 = Colors.transparent;
                            _bgColor3 = Colors.transparent;
                          });
                        },
                        child: Text(
                          'My learning 📚',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                    decoration: BoxDecoration(
                        color: _bgColor1,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  // ignore: deprecated_member_use
                  // ignore: deprecated_member_use
                  Container(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _bgColor2 = Colors.white;
                          _bgColor3 = Colors.transparent;
                          _bgColor1 = Colors.transparent;
                        });
                      },
                      child: Text(
                        'Learn with Chat ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: _bgColor2,
                        borderRadius: BorderRadius.circular(5)),
                  ), // ignore: deprecated_member_use
                  Container(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            _bgColor3 = Colors.white;
                            _bgColor1 = Colors.transparent;
                            _bgColor2 = Colors.transparent;
                          });
                        },
                        child: Text(
                          'Leaderboard ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                    decoration: BoxDecoration(
                        color: _bgColor3,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ],
              ),
              SizedBox(
                height: 2.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        height: 3.5,
                        width: 60,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        height: 3.5,
                        width: 60,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            height: 3.5,
                            width: 60,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              SizedBox(
                child: Container(
                  color: Colors.black87,
                ),
                height: 2,
              ),
              SizedBox(
                height: 25,
              ),
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Chapters.id);
                  },
                  child:
                      Lessons(1, 'Introduce Yourself', true, 'images/1.png')),
              SizedBox(
                height: 45,
              ),
              // ignore: deprecated_member_use
              FlatButton(onPressed:(){Navigator.pushNamed(context, Chapters.id);},child: Lessons(2, 'Some basic words', true, 'images/2.png')),
              SizedBox(
                height: 45,
              ),
              // ignore: deprecated_member_use
              FlatButton(onPressed:(){Navigator.pushNamed(context, Chapters.id);},child: Lessons(3, 'Some more basic words', true, 'images/3.png')),
              SizedBox(
                height: 45,
              ),
              // ignore: deprecated_member_use
              FlatButton(onPressed:(){Navigator.pushNamed(context, Chapters.id);},child: Lessons(4, 'Testing your learning', false, 'images/4.png')),
              SizedBox(
                height: 45,
              ),
              // ignore: deprecated_member_use
              FlatButton(onPressed:(){Navigator.pushNamed(context, Chapters.id);},child: Lessons(5, 'Some more basic words', false, 'images/2.png')),
              SizedBox(
                height: 45,
              ),
              // ignore: deprecated_member_use
              FlatButton(onPressed:(){Navigator.pushNamed(context, Chapters.id);},child: Lessons(6, 'Testing your learning', false, 'images/3.png')),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          // selectedIconTheme: IconThemeData(color: Colors.),
          items: [
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              icon: RaisedButton(
                elevation: 0,
                color: Colors.white,
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
                  elevation: 0,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, Profile.id);
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xff303C6C),
                    child: Icon(Icons.person, color: Colors.white),
                  )),
              // ignore: deprecated_member_use
              title: Text(
                'Profile',
                style: TextStyle(color: Color(0xff303C6C)),
              ),
              backgroundColor: Colors.white,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          iconSize: 35,
          elevation: 5),
    );
  }

  // ignore: non_constant_identifier_names
  Row Lessons(
      var lessonNumber, var lessonName, bool checkedValue, var imageAdd) {
    return Row(
      children: <Widget>[
        // ignore: deprecated_member_use
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            activeColor: Colors.teal.shade200,
            checkColor: Colors.black87,
            value: checkedValue,
            onChanged: (bool? value) {
              setState(() {
                checkedValue = value!;
              });
            },
          ),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white70,
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
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Image.asset("$imageAdd"),
        ),
        SizedBox(
          width: 50,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Lesson $lessonNumber',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '$lessonName',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
        )
      ],
    );
  }
}
