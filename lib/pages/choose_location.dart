// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time_app/utility/getworld_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locationList = [
    WorldTime(place: "America/New_York", flag: 'america.png'),
    WorldTime(place: "Africa/Cairo", flag: 'misor.png'),
    WorldTime(place: "America/Lima", flag: 'peru.png'),
    WorldTime(place: "Asia/Dhaka", flag: 'bd.png'),
    WorldTime(place: "Europe/Paris", flag: 'paris.png'),
    WorldTime(place: "Asia/Tokyo", flag: 'japan.png'),
    WorldTime(place: 'Asia/Kabul', flag: 'pak.webp'),
    WorldTime(place: 'Europe/Moscow', flag: 'russia.webp'),
    WorldTime(place: 'Asia/Riyadh', flag: 'saudi.webp'),
  ];

  void updateTime(index) async {
    final instance = locationList[index];
    await instance.getData();
    Navigator.pop(context, {
      'logTime': instance.time,
      'place': instance.place,
      'isDaytime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('choose location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: locationList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                tileColor: Color.fromARGB(255, 232, 235, 233),
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  '${locationList[index].place}',
                  style: TextStyle(
                    color: Color.fromARGB(255, 61, 58, 46),
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/${locationList[index].flag}'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
