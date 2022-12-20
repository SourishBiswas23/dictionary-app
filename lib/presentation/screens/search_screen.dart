import 'package:dictionary/constants/border_style_constants.dart';
import 'package:dictionary/constants/palette.dart';
import 'package:dictionary/constants/text_style_constants.dart';
import 'package:dictionary/logic/business_logic.dart';
import 'package:dictionary/presentation/screens/loading_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const routeName = '/search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchQuery = TextEditingController();

  @override
  void dispose() {
    _searchQuery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BusinessLogic businessLogic = BusinessLogic();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height / 4),
                  Text(
                    'Dictionary',
                    style: TextStyleConstants.headingTextStyleSerif,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _searchQuery,
                    cursorColor: Palette.textFieldCursorColor,
                    decoration: InputDecoration(
                      label: const Text(
                        'search text',
                        style: TextStyle(color: Colors.grey),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Palette.searchFieldBackgroundColor,
                      filled: true,
                      prefixIcon: Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            businessLogic.searchWord(
                              context: context,
                              searchQuery: _searchQuery.text,
                            );
                          },
                        ),
                      ),
                      enabledBorder:
                          BorderStyleConstants.searchFieldBorderStyle,
                      focusedBorder:
                          BorderStyleConstants.searchFieldBorderStyle,
                      border: BorderStyleConstants.searchFieldBorderStyle,
                    ),
                    onSubmitted: (value) {
                      businessLogic.searchWord(
                        context: context,
                        searchQuery: _searchQuery.text,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
