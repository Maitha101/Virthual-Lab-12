import 'package:flutter/material.dart';
import 'package:virtulab/functions/Student/class_stu_course.dart';
import 'package:virtulab/student/stu_course_grades.dart';
// import './studentNavBar.dart';

class StudentGrades extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentGrades();
  }
}

class _StudentGrades extends State<StudentGrades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Grades'),
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
              'My Grades',
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
                      builder: (BuildContext context) => CourseGrades(),
                    ),
                  );
                }, // Navigate when tapped
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.grading,
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
      ])),
    );
  }
}
