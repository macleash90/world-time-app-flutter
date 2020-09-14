import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static final String routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String img = 'day.png';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    getData();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
//    print(data);
    img = (data['isDayTime']) ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 00, 0, 0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/$img'),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                SizedBox(height: 60),
                RaisedButton.icon(
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.blue,
                  ),
                  label: Text('Go To Locations'),
                  onPressed: () {
//                    Navigator.pushNamed(context, '/location');
//                    Navigator.pushReplacementNamed(context, '/location');
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 26,
//                    fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['time'],
                      style: TextStyle(
                          fontSize: 66,
//                    fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
