import 'package:flutter/material.dart';

class AdminCourses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdminCourses();
  }
}

class _AdminCourses extends State<AdminCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Manage Courses'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(child: Text('manage courses')),
    );
  }
}
