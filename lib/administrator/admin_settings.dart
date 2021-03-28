import 'package:flutter/material.dart';
import 'package:virtulab/change_password.dart';
import 'package:virtulab/contact_support.dart';
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
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Admin Settings'),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.grey.shade100,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .38,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                      height: 130,
                      width: 130,
                      child: Image.asset("assets/images/profile_pic.png",fit: BoxFit.fill,),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.account_circle,size: 30,),
                          SizedBox(width: 15,),
                          Text("Maitha",style: TextStyle(fontSize: 25),),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email,size: 30,),
                        SizedBox(width: 15,),
                        Text("maitha@gmail.com",style: TextStyle(fontSize: 22),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      ],
                    ),
                  ],

                ),
              ),
              SizedBox(height: 15,),

              Card(
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ChangePassword()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(Icons.edit),
                        ),
                        Text('Change Password',style: TextStyle(fontSize: 22),)
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ContactSupport()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(Icons.notifications_off),
                        ),
                        Text('Silence Notifications',style: TextStyle(fontSize: 22),),
                        SizedBox(width: 40,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Switch(value: isSwitched,
                              activeColor: Colors.deepPurple,
                              activeTrackColor: Colors.deepPurpleAccent,
                              onChanged: (value){
                                setState(() {
                                  isSwitched = value;
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (BuildContext context) => ContactSupport()),
                    // );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(Icons.exit_to_app,color: Colors.red,),
                        ),
                        Text('Log Out',style: TextStyle(fontSize: 22,color: Colors.red),)
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}
