import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{

    String location; // location name for uI
    String time; //time in that location
    String flag; //url to an asset flag icon
    String url; //this is the location url for API endpoint
    bool isDaytime; //true - day, night- false
    WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{
    try{
      // make request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get property from data
      String datetime= data['datetime'];
      String offset= data['utc_offset'].substring(0,3);
      // print(datetime);
      // print(offset);


      //create DateTime object
      DateTime now= DateTime.parse(datetime);
      now= now.add(Duration(hours:int.parse(offset) ));
      //set time property
      isDaytime = now.hour> 6 && now.hour< 17 ? true : false;
      time= DateFormat.jm().format(now);


    }
    catch(e){
      print('Caught error: $e');
      time='could not get time data';
    }

  }
}