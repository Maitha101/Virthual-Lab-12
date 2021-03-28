import 'package:flutter/material.dart';
import 'package:virtulab/functions/Student/class_case_study_list.dart';
import 'package:virtulab/functions/class_experiment.dart';

// import './studentNavBar.dart';

class CaseStudiesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CaseStudiesList();
  }
}

class _CaseStudiesList extends State<CaseStudiesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Case Studies'),
          backgroundColor: Colors.deepPurple,
        ),
        body: new Container(
            child: Column(children: <Widget>[
          Expanded(
            child: new ListView.builder(
              itemCount: caseList.length,
              itemBuilder: (context, index) {
                Widget column = Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Multiple texts in a widget
                      Text(
                        caseList[index].caseStudyTitle,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 2,
                            color: Colors.deepPurple),
                      ),
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
                          caseList[index].icon,
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
