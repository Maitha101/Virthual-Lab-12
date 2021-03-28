class StudentCourse {
  final String courseName;
  final String insName;
  final String totalGrade;

  const StudentCourse({this.courseName, this.totalGrade, this.insName});
}

const List<StudentCourse> stuCourse = const <StudentCourse>[
  const StudentCourse(
      courseName: 'Course 1', insName: 'Instructor 1', totalGrade: '19/20'),
  const StudentCourse(
      courseName: 'Course 2', insName: 'Instructor 2', totalGrade: '20/20'),
];
