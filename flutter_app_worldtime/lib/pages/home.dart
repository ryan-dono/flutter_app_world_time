import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    //this is only from loading

    data = data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments;

    //set background
    String bgImg= data['isDaytime'] ?'day.jpg' : 'night.jpg';
   Color bgColor=data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
    backgroundColor: bgColor,
    body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async{
                      dynamic result= await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                          'isDaytime':result['isDaytime'],
                        };
                      });
                      },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[200],
                    ),
                    label: Text(
                        'Update Location',
                        style: TextStyle(
                          color: Colors.grey[100],
                        ),
                    )
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        letterSpacing: 2,

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      color: Colors.white,
                    ),
                ),
              ],
            ),
          ),
        ),



    ),




   );
  }
}
