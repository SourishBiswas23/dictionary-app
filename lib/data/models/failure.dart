class Failure {
  String? title;
  String? message;
  String? resolution;

  Failure({this.title, this.message, this.resolution});

  Failure.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    resolution = json['resolution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    data['resolution'] = resolution;
    return data;
  }
}
