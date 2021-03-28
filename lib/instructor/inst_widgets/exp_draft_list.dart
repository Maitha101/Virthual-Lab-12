import 'package:flutter/material.dart';

class ExpDraftList extends StatelessWidget {
  @override
  // this class displays the drafted case studies
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text(
              'Draft',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) => Card(
              margin: EdgeInsets.all(2.0),
              child: ListTile(
                title: Text('EXP draft card'),
                subtitle: Text('Tap to continue Experiment'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
