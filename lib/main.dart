import 'package:feedproject/models/service.dart';
import 'package:feedproject/screens/feed_screen/feed_screen.dart';
import 'package:feedproject/screens/page2_screen/page2.dart';
import 'package:feedproject/screens/page3_screen/page3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FeedApp());
  loadData();
}

class FeedApp extends StatefulWidget {
  @override
  _FeedAppState createState() => _FeedAppState();
}

class _FeedAppState extends State<FeedApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed App',
      home: MyFeedApp(),
    );
  }
}

class MyFeedApp extends StatefulWidget {
  @override
  _MyFeedAppState createState() => _MyFeedAppState();
}

class _MyFeedAppState extends State<MyFeedApp> {
  @override
  Widget build(BuildContext context) {
    var initialRoute = FeedScreen.id;
    return MaterialApp(
      initialRoute: initialRoute,
      routes: {
        FeedScreen.id: (context) => FeedScreen(),
        PageTwoScreen.id: (context) => PageTwoScreen(),
        PageTheeScreen.id: (context) => PageTheeScreen(),
      },
    );
  }
}
