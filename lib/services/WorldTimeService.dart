import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeService {
  String location = "America/Argentina/Salta";
  String time;
  String flag;
  String url;
  bool isDayTime = true;

  WorldTimeService({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      DateTime now = DateTime.parse(data['utc_datetime']);
      String trimmedOffset = data['utc_offset'].toString().substring(1, 3);
      now = now.add(Duration(
        hours: int.parse(trimmedOffset),
      ));
//      this.time = now.toString();
      isDayTime = (now.hour >= 6 && now.hour <= 18) ? true : false;
      this.time = DateFormat.jm().format(DateTime.now());
    } catch (e) {
      time = 'Could not get the time';
    }
  }

  static List<WorldTimeService> getLocations() {
    return [
      WorldTimeService(
          url: 'Europe/London', location: 'London', flag: 'uk.png'),
      WorldTimeService(
          url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
      WorldTimeService(
          url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
      WorldTimeService(
          url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
      WorldTimeService(
          url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
      WorldTimeService(
          url: 'America/New_York', location: 'New York', flag: 'usa.png'),
      WorldTimeService(
          url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
      WorldTimeService(
          url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    ];
  }
}
