import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTransition extends StatefulWidget {
  @override
  _ShimmerTransitionState createState() => _ShimmerTransitionState();
}

class _ShimmerTransitionState extends State<ShimmerTransition> {
  Duration duration = const Duration(seconds: 2);
  //this function starts the timer for the animation; when time is up it calls
  // handleTimeout() to pop the context
  startTimeout() {
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    Navigator.pop(context);
//    Navigator.of(context).push(
//      MaterialPageRoute(
//        builder: (BuildContext context) => FeedScreen(),
//      ),
//    );
  }

  initState() {
    super.initState();
    this.startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black26,
                width: 1.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black38,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 120.0),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.black38,
                    size: 30.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.black38,
                    size: 30.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.bookmark,
                    color: Colors.black38,
                    size: 30.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black38,
                    size: 30.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Shimmer.fromColors(
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    height: 15.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    height: 15.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 100.0,
                    height: 8.0,
                    color: Colors.white,
                  ),
                ],
              ),
              baseColor: Colors.grey[350],
              highlightColor: Colors.grey[100]),
        ),
      ),
    );
  }
}
