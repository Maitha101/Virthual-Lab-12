import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../inst_create_cs_form.dart';

class CaseStudyQuestions extends StatefulWidget {
  final int index;
  CaseStudyQuestions(this.index);

  @override
  _CaseStudyQuestionsState createState() => _CaseStudyQuestionsState();
}

// this returns the text field that will be duplicated per click on the "add button"
class _CaseStudyQuestionsState extends State<CaseStudyQuestions> {
  TextEditingController _questionsController;
  @override
  void initState() {
    super.initState();
    _questionsController = TextEditingController();
  }

  @override
  void dispose() {
    _questionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _questionsController.text =
          CaseStudyFormState.csQuestionList[widget.index] ?? '';
    });
    return TextFormField(
      controller: _questionsController,
      decoration: InputDecoration(hintText: 'Enter question here'),
      onChanged: (v) => CaseStudyFormState.csQuestionList[widget.index] = v,
    );
  }
}
