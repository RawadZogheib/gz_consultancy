import 'package:flutter/material.dart';
import 'package:gz_consultancy/page/AboutPage.dart';
import 'package:gz_consultancy/page/HomePage.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return Sizer(
    //builder: (context, orientation, deviceType) {
    return MaterialApp(
        title: 'gz_consultancy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: FirstPage(),
        initialRoute: '/HomePage',
        routes: {
          '/HomePage': (context) => const HomePage(),
          '/AboutPage': (context) => const AboutPage(),
        });
    //});
  }
}
