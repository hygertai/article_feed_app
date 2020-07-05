/*
This class holds the functions to parse json data. This class can be furthermore
extended and moved to services folder.
 */

import 'dart:async' show Future;
import 'package:feedproject/models/user_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:feedproject/models/appData.dart';

Future<String> _loadADataAsset() async {
  return await rootBundle.loadString('assets/appData.json');
}

Future loadData() async {
  String jsonString = await _loadADataAsset();
  final jsonResponse = json.decode(jsonString);
  User user = new User.fromJson(jsonResponse);
  AppData data = new AppData.fromJson(jsonResponse);
  //print(data.name);
  print(data.upperFeed);
}
