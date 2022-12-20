import 'package:flutter/material.dart';

class TextStyleConstants {
  static TextStyle headingTextStyleSerif = const TextStyle(
    fontFamily: 'Vidaloka',
    fontSize: 45,
  );

  static TextStyle subHeadingTextStyleSerif = const TextStyle(
    fontFamily: 'Vidaloka',
    fontSize: 35,
  );
  static TextStyle subHeadingTextStyleSansSerif = const TextStyle(
    fontFamily: 'Ubuntu',
    color: Colors.black,
    fontSize: 20,
  );

  static TextStyle paragraphTextStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    fontSize: 18,
    color: Colors.black,
  );

  static TextStyle indexTextStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.black,
  );

  static TextStyle synonymsAndAntonymsTextStyle = TextStyle(
    fontFamily: 'Ubuntu',
    fontSize: 18,
    color: Colors.blue.shade300,
  );

  static TextStyle numberTextStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle countTextStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    color: Colors.grey,
    fontSize: 20,
  );

  static TextStyle phoneticTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.blue.shade300,
  );

  static TextStyle selectedNavbarItemTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  static TextStyle unSelectedNavbarItemTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  static TextStyle partOfSpeechTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );
}
