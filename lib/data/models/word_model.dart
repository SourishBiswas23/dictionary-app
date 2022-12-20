class WordModel {
  String _word = '';
  final List<String> _phonetics = [''];
  final Map<String, List<String>> _meanings = {
    '': ['']
  };
  final Map<String, Map<String, List<String>>> _synonymsAndAntonyms = {
    '': {
      '': ['']
    }
  };

  String get word => _word;

  List<String> get phonetics => _phonetics;

  Map<String, List<String>> get meanings => _meanings;

  Map<String, Map<String, List<String>>> get synonymsAndAntonyms =>
      _synonymsAndAntonyms;

  WordModel.fromJson(Map<String, dynamic> json) {
    // the searched word
    _word = json['word'];
    // The phonetics of the required word
    for (var i in json['phonetics']) {
      if (i['text'] != null) {
        _phonetics.add(i['text']);
      }
    }
    if (_phonetics.length != 1) {
      _phonetics.remove('');
    }
    // Part of speech the word belongs to and its meanings
    for (var i in json['meanings']) {
      _meanings[i['partOfSpeech']] = [
        ...i['definitions'].map((definition) => definition['definition'])
      ];
    }
    if (_meanings.length != 1) {
      _meanings.remove('');
    }
    // Part of speech the word belongs to and its antonyms
    for (var i in json['meanings']) {
      _synonymsAndAntonyms[i['partOfSpeech']] = {
        'synonyms': [...i['synonyms'].map((synonym) => synonym)],
        'antonyms': [...i['antonyms'].map((antonym) => antonym)],
      };
    }
    if (_synonymsAndAntonyms.length != 1) {
      _synonymsAndAntonyms.remove('');
    }
  }
}
