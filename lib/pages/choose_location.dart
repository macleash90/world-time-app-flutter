import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/services/WorldTimeService.dart';
import 'package:flutter_world_time_app/pages/home.dart';

class ChooseLocation extends StatefulWidget {
  static String routeName = '/location';
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTimeService> locations = [];

  void goToLocation(index) async
  {
    locations[index].getTime();
    WorldTimeService instance =
    WorldTimeService(url: locations[index].url);
    await instance.getTime();
    Navigator.pushNamed(context, Home.routeName, arguments: {
      'location': locations[index].location,
      'flag': locations[index].flag,
      'isDayTime': locations[index].isDayTime,
      'url': locations[index].url,
      'time': instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    locations = WorldTimeService.getLocations();
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  onTap: () {
                    goToLocation(index);
                  },
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/${locations[index].flag}'),
                  ),
                  title: Text(locations[index].location)),
            );
          },
          itemCount: locations.length,
        ),
      ),
    );
  }
}
