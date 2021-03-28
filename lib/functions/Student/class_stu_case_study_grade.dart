class StudentCaseStudyGrade {
  final String caseStudyName;
  final String grade;

  const StudentCaseStudyGrade({this.caseStudyName, this.grade});
}

const List<StudentCaseStudyGrade> caseStudyGrade =
    const <StudentCaseStudyGrade>[
  StudentCaseStudyGrade(caseStudyName: 'Case Study 1', grade: '9/10'),
  StudentCaseStudyGrade(caseStudyName: 'Case Study 2', grade: '10/10'),
];
