import 'package:feedproject/screens/feed_screen/feed_screen.dart';
import 'package:feedproject/screens/page2_screen/page2.dart';
import 'package:feedproject/screens/page3_screen/page3.dart';
import 'package:flutter/material.dart';

/* The bottomNavBar is a separate widget because it is used in several pages
 (to provide consistency) of the app and is customized according to the
 given design
*/

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;

  BottomNavBar({
    @required this.selectedIndex,
  });
  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          //fixedColor: Colors.black26,
          items: [
            BottomNavigationBarItem(
              title: Text("Feed"),
              icon: Icon(Icons.star),
            ),
            BottomNavigationBarItem(
              title: Text("Label"),
              icon: Icon(Icons.star),
            ),
            BottomNavigationBarItem(
              title: Text("Label"),
              icon: Icon(Icons.star),
            ),
          ],
          onTap: (int index) {
            setState(() {
              switch (index) {
                case 0:
                  {
                    // Navigate to Dashboard
                    Navigator.pushNamed(context, FeedScreen.id);
                  }
                  break;
                case 1:
                  {
                    // Navigate to Archived List
                    Navigator.pushNamed(context, PageTwoScreen.id);
                  }
                  break;
                case 2:
                  {
                    // Map
                    Navigator.pushNamed(context, PageTheeScreen.id);
                  }
                  break;
                default:
                  {
                    Navigator.pushNamed(context, FeedScreen.id);
                  }
                  break;
              }
            });
          },
        ));
  }
}
