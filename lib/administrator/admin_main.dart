// import 'dart:html';

import 'package:flutter/material.dart';
import 'adminNavBar.dart';
// import 'admin_support.dart';
// import 'admin_courses.dart';
// import 'admin_accounts.dart';
// import 'admin_settings.dart';

const TextStyle _textStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

ButtonStyle _buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
);

int index = 0;

class MainAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // StudentNavBar();
    return MaterialApp(
      title: 'Admin',
      routes: {
        // '/support': (context) => AdminSupport(),
        // '/accounts': (context) => AdminAccounts(),
        // '/courses': (context) => AdminCourses(),
        // '/settings': (context) => AdminSettings(),
        '/nav': (context) => AdminNavBar(),
      },

      // home: AdminNavBar(),
      home: AdminHome(),
    );
  }
}

class AdminHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdminHome();
  }
}

class _AdminHome extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('admin name'), //add function here later
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(40),
            child: Column(
              // shrinkWrap: true,/
              // padding: EdgeInsets.all(20),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  fit: BoxFit.contain,
                  semanticLabel: 'VirtuLab Logo', //image description
                ), // written in pubspec.yaml

                SizedBox(
                  width: 250,
                  height: 75,
                  child: ElevatedButton(
                    style: _buttonStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, '/nav');
                      index = 0;
                    },
                    child: Text(
                      'Technical Support',
                      style: _textStyle,
                    ),
                  ),
                ),

                SizedBox(
                  width: 250,
                  height: 75,
                  child: ElevatedButton(
                    style: _buttonStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, '/nav');
                      index = 1;
                    },
                    child: Text(
                      'Manage Accounts',
                      style: _textStyle,
                    ),
                  ),
                ),

                SizedBox(
                  width: 250,
                  height: 75,
                  child: ElevatedButton(
                    style: _buttonStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, '/nav');
                      index = 2;
                    },
                    child: Text(
                      'Manage Courses',
                      style: _textStyle,
                    ),
                  ),
                ),

                SizedBox(
                  width: 250,
                  height: 75,
                  child: ElevatedButton(
                    style: _buttonStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, '/nav');
                      index = 3;
                    },
                    child: Text(
                      'Settings',
                      style: _textStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),);
  }
}
 int sendIndex(){
   return index;
 }
