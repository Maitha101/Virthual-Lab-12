import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CaseStudyDetail extends StatefulWidget {
  String snapshotKey;
  CaseStudyDetail({this.snapshotKey});

  @override
  _CaseStudyDetailState createState() => _CaseStudyDetailState();
}

class _CaseStudyDetailState extends State<CaseStudyDetail> {
  String title = 'title';
  TextEditingController titleController,
      bodyController,
      discrController,
      gradeController,
      deadlineController;
  DatabaseReference dbRef;
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.reference().child('case_study');
    titleController = TextEditingController();
    bodyController = TextEditingController();
    discrController = TextEditingController();
    gradeController = TextEditingController();
    deadlineController = TextEditingController();
    getDetail();
  }

  getDetail() async {
    DataSnapshot snapshot = await dbRef.child(widget.snapshotKey).once();
    Map caseStudyinfo = snapshot.value;
    titleController.text = caseStudyinfo['title'];
    bodyController.text = caseStudyinfo['body'];
    discrController.text = caseStudyinfo['description'];
    gradeController.text = caseStudyinfo['grade'];
    deadlineController.text = caseStudyinfo['deadline'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('information'),
        ),
        body: Container(
          child: Column(
            children: [
              Text(title),
              TextFormField(
                readOnly: true,
                controller: titleController,
              )
            ],
          ),
        ));
  }
}
