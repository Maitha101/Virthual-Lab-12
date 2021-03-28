import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtulab/widgets/back_button.dart';
import 'inst_create_exp_form.dart';

// THIS CLASS HOLDS THE CASE STUDY FORM
class CreateExperiment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        //   theme: ThemeData(
        //     //properties of divider
        //     dividerTheme: DividerThemeData(
        //       thickness: 2,
        //       color: Colors.black45,
        //       space: 10,
        //     ),
        //   ),
        //   home:
        WillPopScope(
      onWillPop: () async => saveDraft(context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          title: Text('Create Experiment'),
        ),
        body: ExperimentForm(),
      ),
    );
  }
}
