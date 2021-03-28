import 'package:flutter/material.dart';


class InstSettings extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _InstSettings();
  }
  
}

class _InstSettings extends State<InstSettings>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child:
            Text('settings')
      ),
    );
  }
  
}