import 'dart:convert';
import 'package:feedproject/components/bottom_nav_bar.dart';
import 'package:feedproject/models/appData.dart';
import 'package:feedproject/screens/feed_detail_screen/animation.dart';
import 'package:feedproject/screens/feed_detail_screen/feed_detail_screen.dart';
import 'package:feedproject/screens/feed_screen/feed_screen_components/my_list_card.dart';
import 'package:feedproject/screens/feed_screen/feed_screen_components/upper_feed_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async' show Future, Timer;
import 'package:flutter/services.dart' show rootBundle;

class FeedScreen extends StatefulWidget {
  static const String id = 'feed_screen';

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  static const String id = 'feed_screen';
  AppData data;

  Duration duration = const Duration(seconds: 1);

  //this function starts the timer and opens the animation
  startTimeout(AppData data, int index) {
    Timer timer = new Timer(duration, handleTimeout(data, index));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => ShimmerTransition(),
      ),
    );
    return timer;
  }

  // This function changes route to Feed Detail page when animation time is over
  handleTimeout(AppData data, int index) {
    //Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => FeedDetail(data, index),
      ),
    );
  }

  //This function returns the AppData object filled with data from the json file
  Future<AppData> loadData() async {
    String jsonString = await rootBundle.loadString('assets/appData.json');
    setState(() {
      var jsonResponse = json.decode(jsonString);
      data = new AppData.fromJson(jsonResponse);
    });
    return data;
  }

  //This function is used to go to the detail page (of the correct card)
  void _onTapItem(BuildContext context, AppData data, int index) {
    startTimeout(data, index);
//    Navigator.of(context).push(
//      MaterialPageRoute(
//        builder: (BuildContext context) => ShimmerTransition(),
//      ),
//    );
  }

  @override
  void initState() {
    this.loadData();
  }

  @override
  Widget build(BuildContext context) {
    String user = data.user.name;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feed',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                  color: Colors.black87,
                ),
              )),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 20.0, bottom: 10.0),
        child: ListView(
          children: <Widget>[
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 25.0, bottom: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What are you learning today $user?', //since it was the only user in the json
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.45,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.upperFeed.length,
                  itemBuilder: (context, index) {
                    loadData();
                    return GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: UpperFeedCard(
                          data.upperFeed[index].type,
                          data.upperFeed[index].link,
                          data.upperFeed[index].imgUrl,
                          data.upperFeed[index].title,
                          data.upperFeed[index].readTimeMinutes,
                          data.upperFeed[index].text,
                        ),
                      ),
                      onTap: () {
                        _onTapItem(context, data, index);
                      },
                    );
                  }),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 15.0, bottom: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My List',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20.0,
                      color: Colors.black87,
                    )
                  ],
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.myList.length,
                  itemBuilder: (context, index) {
                    loadData();
                    return Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: MyListCard(
                            data.myList[index].type,
                            data.myList[index].link,
                            data.myList[index].imgUrl,
                            data.myList[index].text));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
