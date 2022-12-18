import 'package:dictionary/constants/api_constants.dart';
import 'package:http/http.dart' as http;

Future callApi(String word) async {
  final url = Uri.parse(apiEndpoint + word);
  final apiResponse = http.get(url);
  return apiResponse;
}
