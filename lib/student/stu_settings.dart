import 'package:flutter/material.dart';

import '../contact_support.dart';
// import './studentNavBar.dart';

class StudentSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentSettings();
  }
}

class _StudentSettings extends State<StudentSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Settings'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ContactSupport()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [Text('Contact Support')],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
