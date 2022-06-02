import 'package:flutter/material.dart';
import 'package:framex_statics/home.dart';
import 'package:framex_statics/info_page.dart';
import 'package:framex_statics/rigel_statics.dart';
import 'package:framex_statics/stoyka_statics.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent),

  initialRoute: '/',
  routes: {
        '/': (context) => Home(),
    '/stoyka': (context) => StoykaStatics(),
    '/rigel': (context) => RigelStatics(),
    '/info': (context) => InfoPage()


  },
    ));
