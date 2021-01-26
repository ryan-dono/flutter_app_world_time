import 'package:flutter/material.dart';
import 'package:flutter_app_login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class event extends StatelessWidget{
  final Map alumni;
  event({this.alumni});



  @override
  Widget build(BuildContext context) {

    checkLoginStatus() async{
      SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
      if(sharedPreferences.getString("user")==null)
        {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
        }
    }
    checkLoginStatus();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(alumni['alumniName']),
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          children: <Widget>[
            EventCard(title: alumni['alumniName'].toString()),

            EventCard(title: alumni['alumniName'].toString()),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  EventCard({this.title});

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 10,
      child: Center(child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    );
  }
}