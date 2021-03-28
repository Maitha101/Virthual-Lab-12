import 'package:flutter/material.dart';
import 'package:virtulab/instructor/inst_create_exp_form.dart';
import 'inst_widgets/exp_draft_list.dart';
import './inst_widgets/exp_list.dart';
import 'inst_create_exp.dart';

class InstExperiments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InstExperiments();
  }
}

class _InstExperiments extends State<InstExperiments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.yellow[700],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => CreateExperiment(),
              ),
            );
          },
          icon: Icon(Icons.add),
          label: Text('New'),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Experiments'),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: ExpDraftList(),
              ),
              SizedBox(height: 12), //just to add space between
              Flexible(
                child: ExpList(),
              ),
            ],
          ),
        ));
  }
}
