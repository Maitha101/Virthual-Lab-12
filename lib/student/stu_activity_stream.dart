import 'package:flutter/material.dart';
import 'package:virtulab/functions/Student/class_stu_activity_stream.dart';
import 'studentNavBar.dart';

class MainStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // StudentNavBar();
    return MaterialApp(title: 'Student', home: StudentNavBar());
  }
}

class ActivityStream extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActivityStream();
  }
}

class _ActivityStream extends State<ActivityStream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Activity Stream'),
          backgroundColor: Colors.deepPurple,
        ),
        body: new Container(
            child: Column(
          children: <Widget>[
            Align(
              //Listview
              alignment: Alignment.centerLeft,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 5),
                  child: Text(
                    'Announcments',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: new ListView.builder(
                itemCount: stuStream.length,
                itemBuilder: (context, index) {
                  Widget column = Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Multiple texts in a widget
                        Text(
                          stuStream[index].courseName,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 2,
                              color: Colors.deepPurple),
                        ),
                        Text(stuStream[index].insName),
                        Text(
                          stuStream[index].status,
                          style:
                              TextStyle(height: 2, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ));
                  return Card(
                      child: InkWell(
                    onTap: () {}, //When clicked
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.campaign_sharp,
                            size: 30,
                          ),
                          column,
                          Text('Date'),
                        ],
                      ),
                    ),
                  ));
                },
              ),
            ),
          ],
        )));
  }

  /*ListView _buildListView() {
    return ListView.builder(
        itemCount: courseNames.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(courseNames[index]),
              subtitle: Text(courseInstructors[index]),
              leading: Icon(Icons.alarm_on_sharp),
            ),
          );
        });
  }*/
}

