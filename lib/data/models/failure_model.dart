class FailureModel {
  String _title = '';
  String _message = '';
  String _resolution = '';

  String get title => _title;
  String get message => _message;
  String get resolution => _resolution;

  FailureModel.fromJson(Map<String, dynamic> json) {
    _title = json['title'] as String;
    _message = json['message'] as String;
    _resolution = json['resolution'] as String;
  }
}
