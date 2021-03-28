import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperimentChoices extends StatefulWidget {
  final int index;
  ExperimentChoices(this.index);

  @override
  _ExperimentChoicesState createState() => _ExperimentChoicesState();
}

// this returns the text field that will be duplicated per click on the "add button"
class _ExperimentChoicesState extends State<ExperimentChoices> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Enter Choice here'),
      validator: (v) {
        if (v.trim().isEmpty) return 'please enter a question';
        return null;
      },
    );
  }
}
