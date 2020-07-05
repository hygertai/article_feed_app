import 'package:feedproject/screens/feed_screen/feed_screen_components/actions_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
This class is used to create one card for the lower feed (my list) according to
the given design. Due to some details that were not specified in the document,
I assume the photos didn't have to be cropped or fit a fixed size (in pixels/
ratio). The colors are chosen to resemble the design (shades of black and grey)
 */
class MyListCard extends StatefulWidget {
  final String articleLink;
  final String imgUrl;
  final String title;
  final String type;

  MyListCard(this.type, this.articleLink, this.imgUrl, this.title);

  @override
  _MyListCardState createState() => _MyListCardState();
}

class _MyListCardState extends State<MyListCard> {
  //static const double height = 300.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 8.0, right: 12.0),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                //width: 500.0,
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
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.articleLink.substring(8),
                    style: TextStyle(color: Colors.black45, fontSize: 14.0),
                  ),
                  Container(
                    height: 90.0,
                    child: Text(
                      widget.title,
                      style: TextStyle(color: Colors.black87, fontSize: 18.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(
                    height: 9.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ActionsRow(Icons.bookmark, ''),
                      ActionsRow(Icons.check_circle, ''),
                      ActionsRow(Icons.share, ''),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
