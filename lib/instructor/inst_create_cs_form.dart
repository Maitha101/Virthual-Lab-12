import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'inst_widgets/cs_questions_dynamicTF.dart';
import 'package:firebase_database/firebase_database.dart';

class CaseStudyForm extends StatefulWidget {
  @override
  CaseStudyFormState createState() => CaseStudyFormState();
}

// this Widget takes cs_questions_dynamicTF.dart for duplicaton
class CaseStudyFormState extends State<CaseStudyForm> {
  static List<String> csQuestionList = [null];
  List<Map<dynamic, dynamic>> questions;
  bool dateCheckBoxValue = false;
  final _formkey = GlobalKey<FormState>(); //for validation
  // controllers: (title, body, description, grade, deadline )
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final discrController = TextEditingController();
  final gradeController = TextEditingController();
  final deadlineController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference().child("case_study");
  //----------------------------------------------------------------------------
  // i still dun know how this works but i'll try and understand lol
  List<Widget> _getCaseStudyQuestion() {
    //where the dynamically generated textfield widgets will be stored
    List<Widget> csQuestionTextfield = [];
    for (int i = 0; i < csQuestionList.length; i++) {
      csQuestionTextfield.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Expanded(
                //call class that has dynamic textfield
                child: CaseStudyQuestions(i),
              ),
              SizedBox(width: 16), //for space
              _addRemoveButton(i == csQuestionList.length - 1, i)
            ],
          ),
        ),
      );
    } //end of For loop
    return csQuestionTextfield;
  } // end of _getCaseStudyQuestion()

  //addRemoveButton
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          //add button will only be at last row only
          csQuestionList.insert(0, null);
        } else
          csQuestionList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.yellow[700] : Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon((add) ? Icons.add : Icons.remove, color: Colors.white),
      ),
    );
  }

// CASE STUDY FORM -- START --
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
        child: ListView(
          children: <Widget>[
            Text(
              'Title:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 40,
              child: TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Case Study Title',
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              child: TextFormField(
                controller: discrController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write a short Description of the case study',
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 15),
            Text(
              'Case Study:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              child: TextFormField(
                controller: bodyController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write the Case Study here',
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 15),
            Text(
              'Questions:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            ..._getCaseStudyQuestion(),
            Divider(),
            SizedBox(height: 15),
            Text('Grade:', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              height: 40,
              width: 10,
              child: TextFormField(
                controller: gradeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Grade out of',
                ),
              ),
            ),
            SizedBox(height: 15),
            Text('Deadline:', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: dateCheckBoxValue,
                    onChanged: (bool value) {
                      setState(() {
                        dateCheckBoxValue = value;
                      });
                    },
                  ),
                  Text('No Deadline'),
                ],
              ),
            ),
            //SizedBox(height: 15),
            Container(
              height: 40,
              child: TextFormField(
                controller: deadlineController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //may use date picker instead ..
                  labelText: 'datepicker ..?',
                ),
              ),
            ),
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 15),
            Container(
              child: Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      //csQuestionList.forEach((element) {
                      //questions.add(element);
                      //});
                      dbRef.push().set({
                        "title": titleController.text,
                        "description": discrController.text,
                        "body": bodyController.text,
                        "total_grade": gradeController.text,
                        "deadline": deadlineController.text,
                        "draft": 'false',
                        "questions": csQuestionList
                      });
                      csQuestionList.clear();
                      csQuestionList.add(null);
                      Navigator.pop(context);
                    },
                    child: Text('Submit'),
                    color: Colors.deepPurple,
                  ),
                  SizedBox(width: 15),
                  FlatButton(
                    onPressed: () {
                      dbRef.push().set({
                        "title": titleController.text,
                        "description": discrController.text,
                        "body": bodyController.text,
                        "total_grade": gradeController.text,
                        "deadline": deadlineController.text,
                        "draft": 'true',
                        "questions": csQuestionList
                      });
                      csQuestionList.clear();
                      csQuestionList.add(null);
                      Navigator.pop(context);
                    },
                    child: Text('Save Draft'),
                    color: Colors.black26,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
