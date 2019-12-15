 import 'package:flutter/material.dart';
import 'package:flutter_phone/StatefulWidget.dart';
import 'package:flutter_phone/material.dart';
import 'navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '一统',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:TabNavigator()
    );
  }
}
