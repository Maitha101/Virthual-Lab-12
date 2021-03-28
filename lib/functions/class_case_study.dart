
class CaseStudy{
  String title;
  String description;
  var image; //change type
  var body; //type
  double totalGrade;
  DateTime deadline;
  // bool draft;
  //courseID
  CaseStudy({this.title, this.description, this.image, this.body, this.totalGrade, this.deadline});

  //getters
  String get csTitle => title;
  String get csDescription => description;
  String get csImage => image; //change type
  String get csBody => body; //type
  double get csTotalGrade => totalGrade;
  DateTime get csDeadline => deadline;
  // bool get csDraft => draft;
  //courseID

  void addCaseStudy(CaseStudy cs){
    // cs = new CaseStudy(title, description, image, body, totalGrade, deadline);
  }
}