import 'package:feedproject/models/user_model.dart';
import 'data_model.dart';

/*
This class fills the lists of 'UpperFeed' list and 'MyList' list for the given
user with the data parsed from the json file
 */
class AppData {
  //Map<String, dynamic> myJsonData = json.decode('assets/appData.json');

  User user;
  List<UpperFeed> upperFeed;
  List<MyList> myList;

  AppData({this.user, this.upperFeed, this.myList});

  AppData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['upperFeed'] != null) {
      upperFeed = new List<UpperFeed>();
      json['upperFeed'].forEach((v) {
        upperFeed.add(new UpperFeed.fromJson(v));
      });
    }
    if (json['myList'] != null) {
      myList = new List<MyList>();
      json['myList'].forEach((v) {
        myList.add(new MyList.fromJson(v));
      });
    }
  }
}
