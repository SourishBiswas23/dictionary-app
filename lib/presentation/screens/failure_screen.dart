import 'package:dictionary/constants/text_style_constants.dart';
import 'package:dictionary/data/models/failure_model.dart';
import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({super.key, required FailureModel failureDetail})
      : _failureModel = failureDetail;

  static const routeName = '/failure-screen';
  final FailureModel _failureModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50),
            Text(
              _failureModel.title,
              style: TextStyleConstants.headingTextStyleSerif,
            ),
            const SizedBox(height: 20),
            Text(
              _failureModel.message,
              style: TextStyleConstants.subHeadingTextStyleSansSerif,
            ),
            const SizedBox(height: 20),
            Text(
              _failureModel.resolution,
              style: TextStyleConstants.countTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
