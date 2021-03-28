import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:virtulab/functions/database.dart';
import 'package:virtulab/instructor/inst_course_select.dart';
import 'package:virtulab/student/stu_activity_stream.dart';
import 'package:virtulab/tempnav.dart';

// Future<List<DataSnapshot>> getCourses() async {

//   var result = firebaseref.child('course').once().then((DataSnapshot snapshot) {
//     Map<dynamic, dynamic> courseValues = snapshot.value;
//     courseValues.forEach((key, value) {
//       print(courseValues[{'code', 'name', 'description'}]);
//     });
//   });
//   return await result;
// }

// addCourse(String id, String code, String name, String description, String instID) {
//   firebaseref.child('course').push().set({
//     'code': code,
//     'name': name,
//     'description': description,
//     'instID': instID
//   });
// }

// userSignup(
//     String id, String fname, String lname, String email, String pass) async {


//   if (id.length == 10) {
//     firebaseref.child('student').child(id).set({
//       'ID': id,
//       'fname': fname,
//       'lname': lname,
//       'email': email,
//       'password': pass
//     });
//   }

//   if (id.length == 6) {
//     firebaseref.child('instructor').child(id).set({
//       'ID': id,
//       'fname': fname,
//       'lname': lname,
//       'email': email,
//       'password': pass
//     });
//   }

//   // try {
//   //   await auth.createUserWithEmailAndPassword(email: id, password: pass);
//   // } on FirebaseAuthException catch (e) {
//   //   if (e.code == 'email-already-in-use') {
//   //     print('The account already exists with this ID.');
//   //   }
//   // } catch (e) {
//   //   print(e);
//   // }
// }

// Future userLogin(String id, String pass, context) async {
//   Query _student;
//   Query _instructor;
//   void initState() {
//     // super.initState();
//     _student =
//         firebaseref.child('student').orderByChild('ID').equalTo(id.trim());
//     _instructor =
//         firebaseref.child('instructor').orderByChild('ID').equalTo(id.trim());
//   }

//   if (id.length == 10) {
//     // if student
//     try {
//       await auth.signInWithEmailAndPassword(email: id, password: pass);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('User does not exist');
//       } else if (e.code == 'wrong-password') {
//         print('Incorrect password.');
//       }
//     }

//     Navigator.push(context,
//         MaterialPageRoute(builder: (BuildContext context) => MainStudent()));
//   } else if (id.length == 6) {
//     // if instructor

//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (BuildContext context) => InstCourseSelect()));
//   } else {
//     return 'invalid id';
//   }

//   // Navigator.push(
//   //     context, MaterialPageRoute(builder: (BuildContext context) => TempNaV()));
// }

void signOut() {
  //havent tested this
  auth.signOut();
}
