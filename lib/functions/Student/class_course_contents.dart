import 'package:flutter/material.dart';
import 'package:virtulab/student/stu_caseStudies_list.dart';

class CourseContents {
  final String title;
  final IconData icon;
  const CourseContents({this.title, this.icon});
}

const List<CourseContents> coursesPage = const <CourseContents>[
  const CourseContents(
    title: 'Experiments',
    icon: Icons.device_thermostat,
  ),
  const CourseContents(
    title: 'Case Studies',
    icon: Icons.description_sharp,
  ),
];

/*class Details extends StatelessWidget {
  final CourseContents courseCon;

  const Details({Key key, this.courseCon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ExperimentsList();

    return CaseStudiesList();
  }
}*/
