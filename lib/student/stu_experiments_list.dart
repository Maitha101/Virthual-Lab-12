import 'package:flutter/material.dart';
import 'package:virtulab/functions/Student/class_experiment_list.dart';
import 'package:virtulab/functions/class_experiment.dart';
import 'package:virtulab/student/stu_caseStudies_list.dart';
import 'package:virtulab/student/stu_course_contents.dart';

// import './studentNavBar.dart';

class ExperimentsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExperimentsList();
  }
}

class _ExperimentsList extends State<ExperimentsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Experiments'),
          backgroundColor: Colors.deepPurple,
        ),
        body: new Container(
            child: Column(children: <Widget>[
          Expanded(
            child: new ListView.builder(
              itemCount: expList.length,
              itemBuilder: (context, index) {
                Widget column = Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Multiple texts in a widget
                      Text(
                        expList[index].expTitle,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 2,
                            color: Colors.deepPurple),
                      ),
                      Text(expList[index].attemptsNo),
                    ],
                  ),
                ));
                return Card(
                    child: InkWell(
                  onTap: () {}, // Navigate when tapped
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          expList[index].icon,
                        ),
                        column,
                        RaisedButton(
                          onPressed: () => {},
                          child: Text('Start'),
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ));
              },
            ),
          ),
        ])));
  }
}
