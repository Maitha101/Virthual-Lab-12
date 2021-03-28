import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:virtulab/instructor/inst_course_select.dart';
import 'package:virtulab/student/stu_activity_stream.dart';

import 'database.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _id;

  Future<void> _authenticate(
      String email, String pass, String urlSegemnt) async {
    final Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegemnt?key=AIzaSyCsUnTqzkqXPjp-AfUYD08ilddQQpIxMqE');

    try {
      final response = await http.post(
        url,
        body: json.encode(
            {'email': email, 'password': pass, 'returnSecureToken': true}),
      );
      final message = json.decode(response.body);
      if (message['error'] != null) {
        throw HttpException(message['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> authSignup(String email, String pass) async {
    return _authenticate(email, pass, 'signUp');
  }

  Future<void> authLogin(String email, String pass) async {
    return _authenticate(email, pass, 'signInWithPassword');
  }
}

userSignup(
    String id, String fname, String lname, String email, String pass) async {
  Auth auth = new Auth();
  await auth.authSignup(email, pass);
  // if ( message == 'EMAIL_EXISTS')

  if (id.length == 10) {
    firebaseref.child('student').child(id).set({
      'ID': id,
      'fname': fname,
      'lname': lname,
      'email': email,
      'password': pass
    });
  }

  if (id.length == 6) {
    firebaseref.child('instructor').child(id).set({
      'ID': id,
      'fname': fname,
      'lname': lname,
      'email': email,
      'password': pass
    });
  }
}

userLogin(String email, String pass, context) async {
  Auth authUser = new Auth();
  await authUser.authLogin(email, pass);
  // if (message == 'EMAIL_NOT_FOUND')

  // if (message == 'INVALID_PASSWORD')
}
