// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time_app/utility/getworld_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //getTime data from WorldTime class

  void getTimeData() async {
    WorldTime timeobj = WorldTime(place: 'Asia/Dhaka');
    await timeobj.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'logTime': timeobj.time,
      'place': timeobj.place,
      'isDaytime': timeobj.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    getTimeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Text("hello"),
        SpinKitFoldingCube(
          color: Color.fromARGB(255, 255, 255, 255),
          size: 50.0,
        ),
      ]),
    );
  }
}
