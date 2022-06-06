import 'package:flutter/material.dart';
import 'package:framex_statics/home.dart';
import 'package:framex_statics/info_page.dart';
import 'package:framex_statics/rigel_statics.dart';
import 'package:framex_statics/stoyka_statics.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent),

  initialRoute: '/',
  routes: {
    '/': (context) => const Home(),
    '/stoyka': (context) => const StoykaStatics(),
    '/rigel': (context) => const RigelStatics(),
    '/info': (context) => const InfoPage()


  },
    ));
