import 'package:flutter/material.dart';
import 'adminNavBar.dart';

dynamic callNavBar (){
return AdminNavBar();
}
class AdminSettings extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _AdminSettings();
  }
}



class _AdminSettings extends State<AdminSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(child: Text('admin settings'),
),
      
    );
  }
}
