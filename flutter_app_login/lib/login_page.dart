import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_login/main.dart';
class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  bool _isLoading = false;
  bool _isValidate = false;
  @override
  void dispose() {
   usernameController.dispose();
   passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            headerSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }

 Container headerSection(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("FABU Alumni System",style: TextStyle(color: Colors.white)),
    );
 }

 Container textSection(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget> [
          txtUsername("Username",Icons.lock),
          SizedBox(height: 30.0),
          txtPassword("Password",Icons.lock),

        ],
      ),
    );
 }

 TextFormField txtUsername(String title, IconData icon){
    return TextFormField(
      controller: usernameController,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        errorText: _isValidate ? "This field can't be empty": null,

        hintText: title,
        hintStyle: TextStyle(color: Colors.white70),
        icon: Icon(icon)
      ),
    );
 }

  TextFormField txtPassword(String title, IconData icon){
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
          errorText: _isValidate ? "This field can't be empty": null,
        hintText: title,
        hintStyle: TextStyle(color: Colors.white70),
        icon: Icon(icon)
      ),
    );
  }

SignIn (String username, String password) async{

   Map data={
     'username':username,
     'password':password,
   };
 var jsonData=null;
 SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
var response = await http.post("https://reqres.in/api/login",body:data);
if(response.statusCode==200)
  {
    jsonData = json.decode(response.body);
    setState(() {
      _isLoading=false;
      sharedPreferences.setString("token", jsonData['token']);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainPage()), (Route<dynamic> route) => false);

    });
  }
else
   {
     print(response.body);
   }
}


 Container buttonSection(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      margin: EdgeInsets.only(top: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: RaisedButton(
        onPressed: (){

          if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty)
            {
              setState(() {
                _isLoading=true;
              });
              SignIn(usernameController.text, passwordController.text);
            }
          else{
              setState(() {
                _isValidate=true;
              });
          }
        },
        color: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: Text("Sign In",style: TextStyle(color: Colors.white70)),
      ),

    );
 }

 TextEditingController usernameController = new TextEditingController();
 TextEditingController passwordController = new TextEditingController();
}