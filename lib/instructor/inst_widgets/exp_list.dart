import 'package:flutter/material.dart';

class ExpList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // this class displays the submitted/uploaded case studies
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text(
              'Uploaded',
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
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) => Card(
              margin: EdgeInsets.all(2.0),
              child: ListTile(
                title: Text('EXP card'),
                subtitle: Text('something something'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
