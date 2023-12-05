import 'package:flutter/material.dart';
import 'package:android_app/WorldTimes/WorldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading...';

  void setWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'Germany', url: 'Europe/London');
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

    @override
    void initState() {
      super.initState();
      setWorldTime();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
            child: SpinKitWave(
              color: Colors.blue,
              size: 50,
            )
        ),
      );
    }
  }
