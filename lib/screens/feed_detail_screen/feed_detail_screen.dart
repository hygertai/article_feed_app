import 'package:feedproject/models/appData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/*
This is the page used to display the details of the chosen card/article. The
information is shown in a column form and the bottom appBar is used as specified
in the design (only the back button takes you to main feed page, the rest of the
icons are disabled.
 */
class FeedDetail extends StatefulWidget {
  final AppData data;
  final int index;

  FeedDetail(this.data, this.index);

  @override
  _FeedDetailState createState() => _FeedDetailState();
}

class _FeedDetailState extends State<FeedDetail> {
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  widget.data.upperFeed[widget.index].title,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Image.network(
                    widget.data.upperFeed[widget.index].imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.data.upperFeed[widget.index].readTimeMinutes
                            .toString() +
                        ' minutes reading',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.black45),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  widget.data.upperFeed[widget.index].text,
                  style: TextStyle(fontSize: 20.0, wordSpacing: 2.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
