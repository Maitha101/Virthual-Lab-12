import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'inst_widgets/exp_choices_dynamicTF.dart';

class ExperimentForm extends StatefulWidget {
  @override
  _ExperimentFormState createState() => _ExperimentFormState();
}

//this Widget takes the textfield in cs_questions_dynamicTF.dart and feeds it into
class _ExperimentFormState extends State<ExperimentForm> {
  @override
  // this list will be used to store case study questions
  static List<String> expChoicesList = [null];
  bool dateCheckBoxValue = false;

  // i still dun know how this works but i'll try and understand lol
  List<Widget> _getExperimentChoices() {
    List<Widget> expChoicesTextfield = [];
    for (int i = 0; i < expChoicesList.length; i++) {
      expChoicesTextfield.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Expanded(
                child: ExperimentChoices(i),
              ),
              SizedBox(
                width: 16,
              ),
              _addRemoveButton(i == expChoicesList.length - 1, i)
            ],
          ),
        ),
      );
    }
    return expChoicesTextfield;
  }

  //addRemoveButton
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          expChoicesList.insert(0, null);
        } else
          expChoicesList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon((add) ? Icons.add : Icons.remove, color: Colors.white),
      ),
    );
  }

// EXPERIMENT FORM -- START --
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
        child: ListView(
          children: <Widget>[
            Text(
              'Step *auto incriment*',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 30,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Case Study Title',
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write a short Description of the case study',
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 15),
            Text(
              'Question:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write The question.',
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Choices:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            ..._getExperimentChoices(),
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 15),
            Container(
              child: Row(
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text('Submit'),
                    color: Colors.deepPurple,
                  ),
                  SizedBox(width: 15),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Save Draft'),
                    color: Colors.black26,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
