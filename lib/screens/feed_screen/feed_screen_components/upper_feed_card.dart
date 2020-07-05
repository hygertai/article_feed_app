import 'package:feedproject/screens/feed_screen/feed_screen_components/actions_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
This class is used to create one card for the upper feed according to
the given design. Due to some details that were not specified in the app's document,
I assume the photos didn't have to be cropped or fit a fixed size (in pixels/ ratio)
 */

class UpperFeedCard extends StatefulWidget {
  final String articleLink;
  final String imgUrl;
  final String title;
  final int readTimeMinutes;
  final String text;
  final String type;
  final Function open;

  UpperFeedCard(this.type, this.articleLink, this.imgUrl, this.title,
      this.readTimeMinutes, this.text,
      {this.open});

  @override
  _UpperFeedCardState createState() => _UpperFeedCardState();
}

class _UpperFeedCardState extends State<UpperFeedCard> {
  //static const double height = 300.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          children: <Widget>[
            //Stack is used to put the label on top of the picture
            Stack(
              //fit: StackFit.expand,
              children: [
                Container(
                  //width: 500.0,
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    fit: BoxFit.fitWidth,
//                    image: NetworkImage('https://blog.sertifier.com/wp-content/uploads/2020/06/How-Can-Educators-Be-Successful-In-E-learning-1024x576.png'),
//                  ),
//                ),
                  child: Image.network(
                    widget.imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          widget.type,
                          style: TextStyle(
                            fontSize: 13.0,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.articleLink.substring(8),
                      style: TextStyle(color: Colors.black45, fontSize: 14.0),
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      widget.readTimeMinutes.toString() + ' minutes',
                      style: TextStyle(color: Colors.black45, fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 9.0,
                    ),
                    Text(
                      widget.text,
                      style: TextStyle(color: Colors.black87, fontSize: 14.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 9.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ActionsRow(Icons.bookmark, 'Bookmark'),
                        ActionsRow(Icons.check_circle, 'Mark as read'),
                        ActionsRow(Icons.share, 'Share'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
