class Experiment {
  String title;
  int totalSteps;
  int attemptsNo;
  // bool draft;
  //courseID

  Experiment({this.title, this.totalSteps, this.attemptsNo});

  //getters
  String get expTitle => title;
  int get expTotalSteps => totalSteps;
  int get expAttemptsNo => attemptsNo;
  // bool get expDraft => draft;
  //courseID
}
