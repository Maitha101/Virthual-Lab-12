import 'package:flutter/material.dart';
import 'package:virtulab/administrator/admin_main.dart';
import 'package:virtulab/functions/Student/class_course_contents.dart';
import 'package:virtulab/functions/Student/class_stu_course.dart';
import 'package:virtulab/student/stu_caseStudies_list.dart';
import 'package:virtulab/student/stu_experiments_list.dart';

class StudentCourseContents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentCourseContents();
  }
}
//Details(courseCon: coursesPage[index])

//final routes = ['/student', '/stu_course'];

_getCourseName() {
  for (int i = 0; i <= stuCourse.length; i++) {
    print(stuCourse[index].courseName);
    return stuCourse[index].courseName;
  }
}

/*_getCourseName(int index) {
  ListView.builder(
      itemCount: stuCourse.length,
      itemBuilder: (context, index) {
        return Text(stuCourse[index].courseName);
      });
}*/

class _StudentCourseContents extends State<StudentCourseContents> {
  @override
  Widget build(BuildContext context) {
    return
        //  WillPopScope(
        //   onWillPop: () async => onBackPressed(context , StudentCourses()), //testing
        // child:
        Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_getCourseName()), //Temp data
        backgroundColor: Colors.deepPurple,
      ),
      body: new Container(
        child: Column(children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 5),
              child: Text(
                'Course Contents',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: coursesPage.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ListTile(
                        onTap: () {
                          //Navigate screens
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExperimentsList(),
                              ),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CaseStudiesList(),
                              ),
                            );
                          }
                        },
                        title: Text(coursesPage[index].title),
                        leading: Icon(
                          coursesPage[index].icon,
                          color: Colors.black,
                          size: 30,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ));
                  }))
        ]),
      ),
      // ),
    );
  }
}
