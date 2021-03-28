import 'package:flutter/material.dart';

class AdminAccounts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdminAccounts();
  }
}

class _AdminAccounts extends State<AdminAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Manage Accounts'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(child: Text('manage accounts')),
    );
  }
}
