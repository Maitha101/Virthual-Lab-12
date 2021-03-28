import 'package:flutter/material.dart';
import 'instructorNavBar.dart';

class MainInstructor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // StudentNavBar();
    return MaterialApp(
      title: 'Instructor',
      home: InstructorNavBar()
    );
  }

  
}

class InstReport extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _InstReport();
  }
    
  }

  class _InstReport extends State<InstReport>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Report Summary'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child:
            Text('report summary')
      ),
    );
  }

  }