import 'package:flutter/material.dart';
import 'package:movie/src/utils/route_util.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOVIES',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: route ,
    ); 
  }
}