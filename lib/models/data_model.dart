/*
The UpperFeed class holds the objects for the items shown in the upper feed.
The class is created according to the data fields provided in the json file.
Both classes are in the same file as the models are very similar, but can be
easily separated in case of increased complexity
 */

class UpperFeed {
  int id;
  String type;
  String link;
  String imgUrl;
  String title;
  int readTimeMinutes;
  String text;

  UpperFeed(
      {this.id,
      this.type,
      this.link,
      this.imgUrl,
      this.title,
      this.readTimeMinutes,
      this.text});

  factory UpperFeed.fromJson(Map<String, dynamic> json) {
    return UpperFeed(
      id: json['id'],
      type: json['type'],
      link: json['link'],
      imgUrl: json['imgUrl'],
      title: json['title'],
      readTimeMinutes: json['readTimeMinutes'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['link'] = this.link;
    data['imgUrl'] = this.imgUrl;
    data['title'] = this.title;
    data['readTimeMinutes'] = this.readTimeMinutes;
    data['text'] = this.text;
    return data;
  }
}

/*
The MyList class holds the objects for the items shown in the upper feed.
This class has the same fields as the UpperFeed class but they are separated
to provide modularity and help in maintenance.
 */
class MyList {
  int id;
  String type;
  String link;
  String imgUrl;
  String title;
  int readTimeMinutes;
  String text;

  MyList(
      {this.id,
      this.type,
      this.link,
      this.imgUrl,
      this.title,
      this.readTimeMinutes,
      this.text});

  factory MyList.fromJson(Map<String, dynamic> json) {
    return MyList(
      id: json['id'],
      type: json['type'],
      link: json['link'],
      imgUrl: json['imgUrl'],
      title: json['title'],
      readTimeMinutes: json['readTimeMinutes'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['link'] = this.link;
    data['imgUrl'] = this.imgUrl;
    data['title'] = this.title;
    data['readTimeMinutes'] = this.readTimeMinutes;
    data['text'] = this.text;
    return data;
  }
}
