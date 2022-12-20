import 'package:dictionary/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class WordApi {
  Future callApi(String word) async {
    final url = Uri.parse(apiEndpoint + word);
    final apiResponse = http.get(url);
    return apiResponse;
  }
}
