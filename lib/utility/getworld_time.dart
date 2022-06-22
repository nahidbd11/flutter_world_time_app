import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String? place;
  String time = '';
  late bool isDayTime;
  late String flag;
  WorldTime({this.place, this.flag = ''});

  Future<void> getData() async {
    //setTimeout like in js
    // Future.delayed(Duration(seconds: 1), () {
    //   print("hello");
    // });

    try {
      var url = Uri.parse("http://worldtimeapi.org/api/timezone/$place");
      Response res = await get(url);
      final result = jsonDecode(res.body);
      //get datetime string
      String datetime = result['datetime'];
      String offset = result['utc_offset'].substring(0, 3);

      //convert datetime string to date object
      DateTime now = DateTime.parse(datetime);
      now = now.add(
        Duration(
          hours: int.parse(offset),
        ),
      );
      print(offset);
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
      // time = '$now';
    } catch (e) {
      time = "Error while fetching time";
    }
  }
}
