import 'package:flutter/material.dart';
import 'package:flutter_app_worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime wt =  WorldTime(
      location:'Kuala_Lumpur',
      url: 'Asia/Kuala_Lumpur',
      flag: 'germany.png',
    );
     await wt.getTime();
     Navigator.pushReplacementNamed(context, '/home',arguments:
     {
       'location':wt.location,
       'flag':wt.flag,
       'time':wt.time,
       'isDaytime':wt.isDaytime,
     });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.blue[900],
          size: 50.0,
        ),
      ),
    );
  }
}
