import 'package:flutter/material.dart';
import 'package:virtulab/functions/Student/class_stu_case_study_grade.dart';

// import './studentNavBar.dart';

class CourseGrades extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CourseGrades();
  }
}

class _CourseGrades extends State<CourseGrades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Course 1'), //Temp data
        backgroundColor: Colors.deepPurple,
      ),
      body: new Container(
          child: Column(children: <Widget>[
        Align(
          //Listview
          alignment: Alignment.topCenter,
          child: Container(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: Text(
              'Total',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          )),
        ),
        Divider(),
        Expanded(
          child: new ListView.builder(
            itemCount: caseStudyGrade.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(caseStudyGrade[index].caseStudyName),
                  ),
                  Divider(),
                ],
              );
            },
          ),
        ),
      ])),
    );
  }
}
