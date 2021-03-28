import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class CreateCourse extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference().child('course');
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final descrController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text('new'),
      icon: Icon(Icons.add),
      backgroundColor: Colors.yellow[700],
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Create Course'),
                content: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Write the Course name here',
                                ),
                                controller: nameController,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Write the Course code here',
                                ),
                                controller: codeController,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      'Write the Course description here',
                                ),
                                controller: descrController,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: ElevatedButton(
                                child: Text('create'),
                                onPressed: () {
                                  dbRef.push().set({
                                    'name': nameController.text,
                                    'code': codeController.text,
                                    'description': descrController.text,
                                  });
                                  nameController.clear();
                                  codeController.clear();
                                  descrController.clear();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            });
      },
    );
  }
}
