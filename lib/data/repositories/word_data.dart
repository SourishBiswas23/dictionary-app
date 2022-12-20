import 'dart:convert';

import 'package:dictionary/data/models/failure_model.dart';

import '../data_providers/word.api.dart';
import '../models/word_model.dart';

class WordData {
  final WordApi _api = WordApi();
  late FailureModel _failureModel;
  late WordModel _wordModel;
  late var _response;
  late Map<String, dynamic> _wordResponse;
  late Map<String, dynamic> _error;

  searchWord({required String searchQuery}) async {
    _response = await jsonDecode(
      await _api.callApi(
        searchQuery: searchQuery,
      ),
    );
    if (_response is List) {
      _wordResponse = _response[0];
      _wordModel = WordModel.fromJson(_wordResponse);
      return _wordModel;
    }
    _error = _response;
    _failureModel = FailureModel.fromJson(_error);
    return _failureModel;
  }
}
