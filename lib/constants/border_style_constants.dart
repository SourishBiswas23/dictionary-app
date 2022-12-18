import 'package:dictionary/constants/palette.dart';
import 'package:flutter/material.dart';

class BorderStyleConstants {
  static final searchFieldBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Palette.textFieldBorderColor,
    ),
  );
}
