import 'package:firebase_database/firebase_database.dart';
import 'package:virtulab/functions/database.dart';

class Course {
  final String id;
  final String code;
  final String name;
  final String desc;
  final String instID;

  Course(this.id, this.code, this.name, this.desc, this.instID);

  Course.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        code = json['code'],
        name = json['name'],
        desc = json['description'],
        instID = json['instID'];

  Map<String, dynamic> toJson() => {
        'ID': id,
        'code': code,
        'name': name,
        'description': desc,
        'instID': instID
      };

//   addCourse(String id, String code, String name, String description, String instID) {

//   firebaseref.child('course').push().set({
//     Course.toJson()
//   });
// }
}
