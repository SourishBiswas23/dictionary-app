import 'package:dictionary/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class WordApi {
  Future callApi({required String searchQuery}) async {
    final url = Uri.parse(apiEndpoint + searchQuery);
    final apiResponse = await http.get(url);
    return apiResponse.body;
  }
}
