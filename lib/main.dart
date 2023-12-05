// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';

import 'package:android_app/pages/choose_location.dart';
import 'package:android_app/pages/home.dart';
import 'package:android_app/pages/loading.dart';
import 'package:flutter/material.dart';

main(){
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) =>  const Loading(),
        '/home': (context) => const MyHome(),
        '/location': (context) => const ChooseLocation(),
      },
    )
  );
}