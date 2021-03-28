import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:virtulab/administrator/admin_main.dart';
import 'package:virtulab/instructor/inst_case_study_info.dart';
//import 'package:virtulab/administrator/admin_main.dart';

import 'inst_create_cs.dart';

class InstCaseStudies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InstCaseStudies();
  }
}

class _InstCaseStudies extends State<InstCaseStudies> {
  Query dbRefDraft;
  Query dbRefSubm;
  DataSnapshot snapshot;

  var draft = 'true';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRefDraft = FirebaseDatabase.instance
        .reference()
        .child('case_study')
        .orderByChild('draft')
        .equalTo("true");
    dbRefSubm = FirebaseDatabase.instance
        .reference()
        .child('case_study')
        .orderByChild('draft')
        .equalTo("false");
  }

  //navigateToCaseStudy(DataSnapshot snapshot) {
  //Navigator.push(
  //context,
  //MaterialPageRoute(
  //builder: (context) => CaseStudyDetail(
  // snapshot: snapshot,
  //)));
  //}

  Widget _buildCaseStudyList({Map case_study}) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(10),
          height: 90,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    case_study['title'],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'grade: ' + case_study['total_grade'],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                case_study['deadline'],
                //course['description'],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CaseStudyDetail(snapshotKey: case_study['key'])));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.yellow[700],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => CreateCaseStudy(),
            ),
          );
        },
        icon: Icon(Icons.add),
        label: Text('New'),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Case Studies'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        //SingleChildScrollView(
        padding: EdgeInsets.all(10.0),

        child: Column(
          children: <Widget>[
            Text('Drafts:'),
            Flexible(
              child: Container(
                child: FirebaseAnimatedList(
                    query: dbRefDraft,
                    itemBuilder: (BuildContext context, snapshot,
                        Animation<double> animation, int index) {
                      Map casestudy = snapshot.value;
                      casestudy['key'] = snapshot.key;
                      return _buildCaseStudyList(case_study: casestudy);
                    }),
              ),
            ),
            Text('Uploaded:'),
            Flexible(
              child: Container(
                child: FirebaseAnimatedList(
                  query: dbRefSubm,
                  itemBuilder: (BuildContext context, snapshot,
                      Animation<double> animation, int index) {
                    Map casestudy = snapshot.value;
                    casestudy['key'] = snapshot.key;
                    return _buildCaseStudyList(case_study: casestudy);
                  },
                ),
              ),
            )
            //Flexible(
            //child: CsDraftList(),
            //),
            //SizedBox(height: 12), //just to add space between
            //Flexible(
            //child: CsList(),
            // ),
          ],
        ),
      ),
    );
  }
}
