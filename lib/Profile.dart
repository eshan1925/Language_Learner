import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:language/Third_Page.dart';
import 'contactUs.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';


class Profile extends StatefulWidget {
  static const String id = 'Profile_screen';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  signOut() async{
    _auth.signOut();
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
        child: Container(
          child:Column(
              children: <Widget>[
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
                      width: 100,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3),
                    )
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  child: Hero(
                    tag: 'profile_image',
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 55,
                      child: CircleAvatar(
                          backgroundImage: AssetImage("images/P1.png"),
                          radius: 52),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Eshan Gupta",
                    style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    padding: EdgeInsets.fromLTRB(70, 10,70, 10),
                    onPressed: signOut,
                    color: Colors.orange,
                    child:Text('Sign-Out',style: TextStyle(
                      color:Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 360,
                  width: 390,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xe6f2f2f2),

                  ),
                  child: ListView(
                    children: [
                      Text(
                        'How much have you learned?',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 300,
                        width: 390,
                        child: Image.asset(
                          'images/learning.png',
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Image.asset('images/Streak.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      bottomNavigationBar: Container(
        height: 80,
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
