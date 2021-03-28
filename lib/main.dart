import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtulab/functions/database.dart';
import 'package:virtulab/functions/func_all.dart';
import 'package:virtulab/instructor/inst_course_select.dart';
import 'package:virtulab/student/stu_caseStudies_list.dart';
import 'package:virtulab/student/stu_course_contents.dart';
import 'package:virtulab/student/stu_experiments_list.dart';
import './sign_up.dart';
import 'functions/auth.dart';
import 'student/stu_activity_stream.dart';
import 'student/stu_course_register.dart';
import 'instructor/inst_report.dart';
import 'administrator/admin_main.dart';
import 'tempnav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VirtuLab());
}

class VirtuLab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/signup': (context) => SignUp(),
        '/student': (context) => MainStudent(), //student
        '/stu_course': (context) => StuCourseRegister(), //student course select
        '/instructor': (context) => MainInstructor(), //instructor
        '/admin': (context) => MainAdmin(), //admin
        '/temp': (context) => TempNaV(), //temporary navigation
        // '/course_page': (context) => StudentCoursePage(),
        // coursesPage[0].route: (context) => Scaffold(
        //     appBar: AppBar(title: Text(coursesPage[0].title)),),  //first route
        // coursesPage[1].route: (context) => Scaffold(
        //     appBar: AppBar(title: Text(coursesPage[1].title)),),
        '/experiment_list': (context) => ExperimentsList(),
        '/caseStudy_list': (context) => CaseStudiesList(),
      },
      title: 'Login',
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  // This widget is the root of the application.
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<Homepage> {
  // Query _studID;
  // Query _studPass;

  // Query _instID;
  // Query _instPass;
  FirebaseAuth _auth;

  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    // if (_idController.text.length == 10) {
    //   _studID = firebaseref.child('student').orderByChild('ID');
    //   _studPass =
    //       firebaseref.child('student').child('password').orderByChild('ID');
    // } else if (_idController.text.length == 6) {
    //   _instID = firebaseref.child('instructor').orderByChild('ID');
    //   _instPass =
    //       firebaseref.child('instructor').child('password').orderByChild('ID');
    // }
  }

  // getCurrentUser() async{
  //   var currentUser = await _auth.currentUser;
  //   return currentUser;

  // }

  _validateEmail(String id) {
    if (id.isEmpty) {
      return '* Required';
    }
    if (id.length != 10 && id.length != 6) {
      return 'Invalid ID';
    }

    // if (id.length == 10) {
    //   String _checkExistence() {
    //     Map _studIDMap;
    //     firebaseref
    //         .child('student')
    //         .orderByChild('ID')
    //         .equalTo(id)
    //         .once()
    //         .then((DataSnapshot snapshot) {
    //       _studIDMap = snapshot.value;
    //       _studIDMap['key'] = snapshot.key;
    //       return _validateID(_studIDMap['ID'].toString());
    //       // if(_studIDMap['ID'].toString().isEmpty){
    //       //   return 'Student doesn\'t exist'; //doesnt work
    //       // }
    //     });
    //     return null;
    //   }

    //   if (_checkExistence().isEmpty) {
    //     return 'Student doesn\'t exist';
    //   }
    // }

    // if (id.length == 6) {
    //   _checkExistence() {
    //     Map _instIDMap;
    //     firebaseref
    //         .child('instructor')
    //         .orderByChild('ID')
    //         .equalTo(id)
    //         .once()
    //         .then((DataSnapshot snapshot) {
    //       _instIDMap = snapshot.value;
    //       _instIDMap['key'] = snapshot.key;
    //       return _instIDMap['ID'];
    //       // if(_instIDMap['ID'].toString().isEmpty){
    //       //   return 'Instructor doesn\'t exist'; //doesnt work
    //       // }
    //     });
    //   }

    //   if (_checkExistence() == null) {
    //     return 'Instructor doesn\'t exist';
    //   }
    // }

    return null;
  }

  _validatePass(String pass) {
    if (pass.isEmpty) {
      return '* Required';
    }
    return null;
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (cxt) => AlertDialog(
        title: Text('OOPS'),
        content: Text('message'),
        actions: <Widget>[
          TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(cxt).pop();
              }),
        ],
      ),
    );
  }

  //these take user input from TextFormField
  final _idController = TextEditingController();
  final _passController = TextEditingController();
  final _loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //test on this line
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('VirtuLab'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          //color: Colors.grey[300],
          width: double
              .infinity, //to make the contents center ((be as big as the parent allows))
          height: double.infinity,
          padding: EdgeInsets.all(20),
          child: Form(
            key: _loginForm,
            child: ListView(children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  'assets/images/logo.png',
                  // width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                  semanticLabel: 'VirtuLab Logo', //image description
                ), // written in pubspec.yaml

                SizedBox(
                  height: 20,
                ), //space between widgets

                Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: 20,
                ),
                //...........................................Email............................................
                Container(
                  width: 275,
                  child: TextFormField(
                    controller: _idController,
                    maxLines: 1,
                    minLines: 1,
                    validator: (value) => _validateEmail(value),
                    keyboardType: TextInputType.emailAddress,
                    // inputFormatters: [
                    // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    // ],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Academic Email'),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                // .........................................Password........................................
                Container(
                  width: 275,
                  child: TextFormField(
                    controller: _passController,
                    maxLines: 1,
                    minLines: 1,
                    validator: (value) => _validatePass(value),
                    //onChanged: , //when user leaves this textfield
                    //onFieldSubmitted: , //when user presses submit button
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Password'),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        // if (_loginForm.currentState.validate()) {
                        try {
                          userLogin(_idController.text, _passController.text,
                              context);
                          Navigator.pushNamed(context, '/temp'); // route
                          //  if (_idController.text.length == 10) {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (BuildContext context) =>
                          //               MainStudent()));
                          // } else if (_idController.text.length == 6) {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (BuildContext context) =>
                          //               InstCourseSelect()));
                          // }
                        } on HttpException catch (error) {
                          var errorMessage = 'Authntication Failed';
                          if (error.message.contains('EMAIL_NOT_FOUND')) {
                            errorMessage = 'This user doesnt exist';
                          } else if (error.message
                              .contains('INVALID_PASSWORD')) {
                            errorMessage = 'Invalid password';
                          }
                          _showError(errorMessage);
                        } catch (error) {
                          var errorMessage =
                              'An error occurred. Try again later';
                          _showError(errorMessage);
                        }
                        //
                        // }
                      }, //login function

                      child: Text('Login')),
                ),

                SizedBox(
                  height: 20,
                ),

                Text(
                  'Don\'t have an account?',
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 100,
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(context,
                        '/signup'), //defined in MaterialApp (routes: {}) at the top

                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
