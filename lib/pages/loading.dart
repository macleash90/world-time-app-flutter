import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/services/WorldTimeService.dart';
import 'package:flutter_world_time_app/pages/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_world_time_app/pages/choose_location.dart';
class Loading extends StatefulWidget {
  static String routeName = '/loading';
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
//  String time = 'loading';

  void getTheTime() async {
    WorldTimeService worldTime = WorldTimeService(
        url: "America/Argentina/Salta",
        flag: 'argentina.png',
        location: 'Argentina');
    await worldTime.getTime();
//    Navigator.pushReplacementNamed(context, Home.routeName, arguments: {
//      'location': worldTime.location,
//      'flag': worldTime.flag,
//      'url': worldTime.url,
//      'time': worldTime.time,
//      'isDayTime': worldTime.isDayTime,
//    });
  Navigator.pushReplacementNamed(context, ChooseLocation.routeName );
//    setState(() {
//      time = worldTime.time;
//    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTheTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
          child: Center(
        child: SpinKitRing(
          color: Colors.blue,
          size: 50.0,
        ),
      )),
    );
  }
}
