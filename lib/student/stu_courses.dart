import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:virtulab/functions/Student/class_stu_course.dart';
import 'package:virtulab/functions/class_course.dart';
import 'package:virtulab/functions/class_instructor.dart';
import 'stu_course_contents.dart';
import 'package:virtulab/student/stu_course_register.dart';

// import './studentNavBar.dart';

class StudentCourses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentCourses();
  }
}

class _StudentCourses extends State<StudentCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Courses'),
          backgroundColor: Colors.deepPurple,
        ),
        body: new Container(
            child: Column(children: <Widget>[
          Align(
            //Listview
            alignment: Alignment.centerLeft,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 5),
              child: Text(
                'My Courses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )),
          ),
          Expanded(
            child: new ListView.builder(
              itemCount: stuCourse.length,
              itemBuilder: (context, index) {
                Widget column = Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Multiple texts in a widget
                      Text(
                        stuCourse[index].courseName,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 2,
                            color: Colors.deepPurple),
                      ),
                      Text(stuCourse[index].insName),
                    ],
                  ),
                ));
                return Card(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            StudentCourseContents(),
                      ),
                    );
                  }, // Navigate when tapped
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.auto_stories,
                        ),
                        column,
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ));
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        FloatingActionButton.extended(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  StuCourseRegister(),
                            ),
                          ), //When pressed
                          icon: Icon(Icons.add),
                          label: Text(
                            "Add New Course",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.amber,
                        ),
                      ],
                    ))),
          ),
        ])));
  }
}
