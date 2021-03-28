import 'package:sqflite/sqflite.dart';
import 'database.dart';

class Student {
  String studID;
  String fname;
  String lname;
  String email;
  String password;

  Student({this.studID, this.fname, this.lname, this.email, this.password});

  //getters
  String get sID => studID;
  String get sFname => fname;
  String get sLname => lname;
  String get sEmail => email;
  String get sPassword => password;

  // Convert into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'studID': studID,
      'fname': fname,
      'lname': lname,
      'email': email,
      'password': password,
    };
  }

  Future<void> addStudent(Student student) async {
    firebaseref.child('student').set({
      'studID': this.studID,
      'fname': this.fname,
      'lname': this.lname,
      'email': this.email,
      'password': this.password
    });

    // Get a reference to the database.
    // Database db = await database; // 'database' is the reference, 'db' is local var

    // db.insert(
    //   'student', //table name in db
    //   student.toMap(), //map
    //   conflictAlgorithm: ConflictAlgorithm.replace,
    // );

    // student = new Student(studID, fname, lname, email, password);
  }

  //get * from student
  Future<List<Student>> student() async {
    // firebaseref.



    //student() is name of db table
    // Database db = await database;
    // final List<Map<String, dynamic>> maps =
    //     await db.query('student'); //table name
    // return List.generate(maps.length, (i) {
    //   return Student(
    //     studID: maps[i]['studID'],
    //     fname: maps[i]['fname'],
    //     lname: maps[i]['lname'],
    //     email: maps[i]['email'],
    //     password: maps[i]['password'],
    //   );
    // });
  }
}
