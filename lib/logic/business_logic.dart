import 'package:flutter/widgets.dart';

import '../presentation/screens/search_screen.dart';

class BusinessLogic {
  void splashScreenLoaded(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(SearchScreen.routeName);
  }
}
