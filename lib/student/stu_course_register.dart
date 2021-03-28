// import 'dart:js';
// import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart'; //search bar
import 'package:path/path.dart';
import 'package:virtulab/functions/class_course.dart';
import 'package:virtulab/functions/class_instructor.dart';
import 'package:virtulab/functions/database.dart';
import 'package:virtulab/student/stu_activity_stream.dart';
import 'stu_activity_stream.dart';

// Future<List<Course>> searchCourses(String search) async{
//   var maps = getCourses();

// }
// Future<List<Course>> searchCourses(String search) async {
//   //idk i copied and pasted
//   final List <Map<String, dynamic>> maps = getCourses();
//   await Future.delayed(Duration(seconds: 1));
//   return List.generate(maps.length, (int i) { //search
//     return Course.fromJson(
//       id: maps[i]['ID'],
//       code: maps[i]['code'],
//       name: maps[i]['name'],
//       description: maps[i]['description'],
//       instructor: maps[i]['instID'],
//     );
//   });
// }

class StuCourseRegister extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StuCourseRegister();
  }
}

class _StuCourseRegister extends State<StuCourseRegister> {
  Query allCourses;
  Query instName;
  void initState() {
    super.initState();
    allCourses = firebaseref.child('course').orderByChild('name');
    instName = firebaseref.child('instructor').orderByChild('instID');
  }

  Widget courseList({Map courseList}) {
    // Widget getInstName(String id) { //figure this out
    //   Map instructor;
    //   FirebaseAnimatedList(
    //     query: instName,
    //     itemBuilder: (BuildContext context, snapshot,
    //         Animation<double> animation, int index) {
    //       instructor = snapshot.value;
    //       // instructor['key'] = snapshot.key;
    //       instructor['instID'] = id;
    //       instructor['fname'] = snapshot.value['fname'];
    //       instructor['lname'] = snapshot.value['lname'];
    //       return Text(instructor['fname'] + instructor['lname']);
    //     },
    //   );
    // }

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(this.context,
              MaterialPageRoute(builder: (context) => MainStudent()));
        }, //add function to add student to course
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(10),
          height: 70,
          color: Colors.white,
          child: Row(
            children: [
              Text('Name:'+ courseList['name'] +
                  '\n' +
                  'code:'+ courseList['code'] +
                  '\n' +
                  'inst:'+ courseList['instID']),
              // getInstName(courseList['instID'].toString()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Course Register'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        // child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          // child: Column(
          //   children: [
          child: FirebaseAnimatedList(
            query: allCourses,
            itemBuilder: (BuildContext context, snapshot,
                Animation<double> animation, int index) {
              Map _courses = snapshot.value;
              _courses['key'] = snapshot.key;
              return courseList(courseList: _courses);
            },
          ),
          //   ],
          // ),

          // SearchBar<FirebaseAnimatedList>(
          //   hintText: 'Search Courses',
          //   emptyWidget: Text('No courses found'),
          //   onSearch: searchCourseList,
          //   onItemFound: (FirebaseAnimatedList course, int index) {
          //     return ListTile(
          //       title: Text(course['name']),
          //       subtitle: Text(course['instID']),
          //       onTap: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => MainStudent()));
          //       },
          //     );
          //   },
          // ),
        ),
      ),
      // ),
    );
  }
}
