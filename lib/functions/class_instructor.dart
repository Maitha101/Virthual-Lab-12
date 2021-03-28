class Instructor{
  String instID;
  String fname;
  String lname;
  String email;
  String password;

  Instructor({this.instID, this.fname, this.lname, this.email, this.password});

  //getters
  String get inID => instID;
  String get inFname => fname;
  String get inLname => lname;
  String get inEmail => email;
  String get inPassword => password;


  void addInst(Instructor instructor) {
    // instructor = new Instructor(instID, fname, lname, email, password);
  }
}

