import 'package:dictionary/data/models/failure_model.dart';
import 'package:dictionary/data/models/word_model.dart';
import 'package:dictionary/data/repositories/word_data.dart';
import 'package:dictionary/presentation/screens/failure_screen.dart';
import 'package:dictionary/presentation/screens/loading_screen.dart';
import 'package:dictionary/presentation/screens/word_detail_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/search_screen.dart';

class BusinessLogic {
  BusinessLogic._privateConstructor();
  static final BusinessLogic _instance = BusinessLogic._privateConstructor();
  factory BusinessLogic() {
    return BusinessLogic._instance;
  }

  bool isLoading = false;
  var _response;
  final WordData wordData = WordData();

  void splashScreenLoaded({required BuildContext context}) {
    Navigator.of(context).pushReplacementNamed(SearchScreen.routeName);
  }

  void loadLoadingScreen({required BuildContext context}) {
    if (isLoading) {
      return;
    }
    isLoading = true;
    Navigator.of(context).pushNamed(LoadingScreen.routeName);
  }

  void searchWord({
    required BuildContext context,
    required String searchQuery,
  }) async {
    loadLoadingScreen(context: context);
    _response = await wordData.searchWord(searchQuery: searchQuery);
    if (_response is WordModel) {
      displaySearchResult(context: context, wordModel: _response);
    } else {
      displayFailureScreen(context: context, failureModel: _response);
    }
  }

  void displaySearchResult({
    required BuildContext context,
    required WordModel wordModel,
  }) {
    if (isLoading) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WordDetailScreen(wordDetail: wordModel),
      ),
    );
  }

  void displayFailureScreen({
    required BuildContext context,
    required FailureModel failureModel,
  }) {
    if (isLoading) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FailureScreen(failureDetail: failureModel),
      ),
    );
  }
}
