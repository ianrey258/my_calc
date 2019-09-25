import 'package:flutter/material.dart';
import 'package:my_calc/calculator1.dart';
import 'package:my_calc/calculator2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String,WidgetBuilder>{
        'page2':(BuildContext context) => MyHomePage2(),
      },
    );
  }
}


