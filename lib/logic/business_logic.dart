import 'package:dictionary/data/models/word_model.dart';
import 'package:dictionary/data/repositories/word_data.dart';
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
  late WordModel _wordModel;
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
    _wordModel = await wordData.searchWord(searchQuery: searchQuery);
    displaySearchResult(context: context, wordModel: _wordModel);
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
        builder: (context) => WordDetailScreen(wordDetail: _wordModel),
      ),
    );
  }
}
