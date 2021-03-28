class StudentActivityStream {
  final String courseName;
  final String insName;
  final String status;

  const StudentActivityStream({this.courseName, this.insName, this.status});
}

const List<StudentActivityStream> stuStream = const <StudentActivityStream>[
  const StudentActivityStream(
    courseName: 'Course 1',
    insName: 'Instructor 1',
    status: 'Added Successfully!',
  ),
  const StudentActivityStream(
    courseName: 'Course 2',
    insName: 'Instructor 2',
    status: 'Added Successfully!',
  ),
  const StudentActivityStream(
    courseName: 'Course 3',
    insName: 'Instructor 3',
    status: 'Added Successfully!',
  ),
];
