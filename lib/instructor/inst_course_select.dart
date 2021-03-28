import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:virtulab/instructor/inst_create_course.dart';
import 'package:virtulab/instructor/inst_report.dart';
import 'inst_create_course.dart';

class InstCourseSelect extends StatefulWidget {
  @override
  _InstCourseSelectState createState() => _InstCourseSelectState();
}

class _InstCourseSelectState extends State<InstCourseSelect> {
  Query dbRef;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.reference().child('course');
  }

  Widget _buildCourseList({Map course}) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        height: 130,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  course['name'],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  course['code'],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              'instructor name',
              //course['description'],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MainInstructor(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CreateCourse(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Courses Selection'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map course = snapshot.value;
            course['key'] = snapshot.key;
            return _buildCourseList(course: course);
          },
        ),
      ),
    );
  }
}
