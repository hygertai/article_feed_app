import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
This widget is used in the cards UpperFeedCard to group actions (icons and text)
 */
class ActionsRow extends StatelessWidget {
  final IconData icon;
  final String action;

  ActionsRow(this.icon, this.action);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 20.0,
            color: Colors.black45,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(
            '$action',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 12.0,
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
        ],
      ),
    );
  }
}
