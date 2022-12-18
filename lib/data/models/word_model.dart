class WordModel {
  String? word;
  String? phonetic;
  List<PhoneticsModel>? phonetics;
  List<MeaningsModel>? meanings;
  LicenseModel? license;
  List<String>? sourceUrls;

  WordModel({
    this.word,
    this.phonetic,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });

  WordModel.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    phonetic = json['phonetic'];
    if (json['phonetics'] != null) {
      phonetics = <PhoneticsModel>[];
      json['phonetics'].forEach((v) {
        phonetics!.add(PhoneticsModel.fromJson(v));
      });
    }
    if (json['meanings'] != null) {
      meanings = <MeaningsModel>[];
      json['meanings'].forEach((v) {
        meanings!.add(MeaningsModel.fromJson(v));
      });
    }
    license =
        json['license'] != null ? LicenseModel.fromJson(json['license']) : null;
    sourceUrls = json['sourceUrls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word'] = word;
    data['phonetic'] = phonetic;
    if (phonetics != null) {
      data['phonetics'] = phonetics!.map((v) => v.toJson()).toList();
    }
    if (meanings != null) {
      data['meanings'] = meanings!.map((v) => v.toJson()).toList();
    }
    if (license != null) {
      data['license'] = license!.toJson();
    }
    data['sourceUrls'] = sourceUrls;
    return data;
  }
}

class PhoneticsModel {
  String? text;
  String? audio;
  String? sourceUrl;
  LicenseModel? license;

  PhoneticsModel({this.text, this.audio, this.sourceUrl, this.license});

  PhoneticsModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    audio = json['audio'];
    sourceUrl = json['sourceUrl'];
    license =
        json['license'] != null ? LicenseModel.fromJson(json['license']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['audio'] = audio;
    data['sourceUrl'] = sourceUrl;
    if (license != null) {
      data['license'] = license!.toJson();
    }
    return data;
  }
}

class MeaningsModel {
  String? partOfSpeech;
  List<DefinitionsModel>? definitions;
  List<String>? synonyms;
  List<String>? antonyms;

  MeaningsModel(
      {this.partOfSpeech, this.definitions, this.synonyms, this.antonyms});

  MeaningsModel.fromJson(Map<String, dynamic> json) {
    partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      definitions = <DefinitionsModel>[];
      json['definitions'].forEach((v) {
        definitions!.add(DefinitionsModel.fromJson(v));
      });
    }
    synonyms = json['synonyms'].cast<String>();
    antonyms = json['antonyms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['partOfSpeech'] = partOfSpeech;
    if (definitions != null) {
      data['definitions'] = definitions!.map((v) => v.toJson()).toList();
    }
    data['synonyms'] = synonyms;
    data['antonyms'] = antonyms;
    return data;
  }
}

class DefinitionsModel {
  String? definition;
  String? example;

  DefinitionsModel({this.definition, this.example});

  DefinitionsModel.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    example = json['example'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['definition'] = definition;
    data['example'] = example;
    return data;
  }
}

class LicenseModel {
  String? name;
  String? url;

  LicenseModel({this.name, this.url});

  LicenseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
