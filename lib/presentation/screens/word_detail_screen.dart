import 'package:dictionary/constants/example_response.dart';
import 'package:dictionary/constants/text_style_constants.dart';
import 'package:dictionary/data/models/word_model.dart';
import 'package:flutter/material.dart';

class WordDetailScreen extends StatefulWidget {
  const WordDetailScreen({super.key});

  @override
  State<WordDetailScreen> createState() => _WordDetailScreenState();
}

class _WordDetailScreenState extends State<WordDetailScreen> {
  WordModel wordDetail = WordModel.fromJson(dummyResponse[0]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      wordDetail.word,
                      style: TextStyleConstants.headingTextStyleSerif,
                    ),
                    const SizedBox(height: 10),
                    phoneticsList(phoneticsList: wordDetail.phonetics),
                    const SizedBox(height: 40),
                    details(
                      meanings: wordDetail.meanings,
                      synonymsAndAntonyms: wordDetail.synonymsAndAntonyms,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget phoneticsList({required List<String> phoneticsList}) {
  return Wrap(
    children: [
      ...phoneticsList.map(
        (phonetic) {
          return Text(
            '$phonetic  ',
            style: TextStyleConstants.phoneticTextStyle,
          );
        },
      ),
    ],
  );
}

Widget details({
  required Map<String, List<String>> meanings,
  required Map<String, Map<String, List<String>>> synonymsAndAntonyms,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ...meanings.entries.map(
        (meaning) {
          final definitions = meaning.value;
          final partOfSpeech = meaning.key;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade600,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  meaning.key,
                  style: TextStyleConstants.partOfSpeechTextStyle,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'DEFINITIONS ',
                  style: TextStyleConstants.subHeadingTextStyleSansSerif,
                  children: [
                    TextSpan(
                      text: definitions.length.toString(),
                      style: TextStyleConstants.countTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ...List.generate(
                definitions.length,
                (index) {
                  return Column(
                    children: [
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${index + 1}. ',
                                  style: TextStyleConstants.indexTextStyle,
                                ),
                                TextSpan(
                                  text: definitions[index],
                                  style: TextStyleConstants.paragraphTextStyle,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'SYNONYMS ',
                            style:
                                TextStyleConstants.subHeadingTextStyleSansSerif,
                            children: [
                              TextSpan(
                                text: synonymsAndAntonyms[meaning.key]![
                                        'synonyms']!
                                    .length
                                    .toString(),
                                style: TextStyleConstants.countTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(
                          synonymsAndAntonyms[meaning.key]!['synonyms']!.length,
                          (index) {
                            return Column(
                              children: [
                                Text(
                                  synonymsAndAntonyms[meaning.key]![
                                      'synonyms']![index],
                                  style: TextStyleConstants
                                      .synonymsAndAntonymsTextStyle,
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'ANTONYMS ',
                            style:
                                TextStyleConstants.subHeadingTextStyleSansSerif,
                            children: [
                              TextSpan(
                                text: synonymsAndAntonyms[meaning.key]![
                                        'antonyms']!
                                    .length
                                    .toString(),
                                style: TextStyleConstants.countTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(
                          synonymsAndAntonyms[meaning.key]!['antonyms']!.length,
                          (index) {
                            return Column(
                              children: [
                                Text(
                                  synonymsAndAntonyms[meaning.key]![
                                      'antonyms']![index],
                                  style: TextStyleConstants
                                      .synonymsAndAntonymsTextStyle,
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          );
        },
      )
    ],
  );
}
