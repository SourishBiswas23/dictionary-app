import 'dart:convert';

import '../data_providers/word.api.dart';
import '../models/word_model.dart';

class WordData {
  final WordApi _api = WordApi();
  late WordModel _wordModel;
  late Map<String, dynamic> _response;

  searchWord({required String searchQuery}) async {
    _response = await jsonDecode(
      await _api.callApi(
        searchQuery: searchQuery,
      ),
    )[0];
    _wordModel = WordModel.fromJson(_response);
    return _wordModel;
  }
}
