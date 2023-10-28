class QuranModel {
  int id;
  String name;
  String nameEn;
  String nameTranslation;
  int words;
  int letters;
  String type;
  String typeEn;
  String ar;
  List<QuranArrayModel> array;

  QuranModel({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.nameTranslation,
    required this.words,
    required this.letters,
    required this.type,
    required this.typeEn,
    required this.ar,
    required this.array,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    List<QuranArrayModel> array = List<QuranArrayModel>.from(
      json["array"].map((x) => QuranArrayModel.fromJson(x)),
    );

    return QuranModel(
      id: json["id"],
      name: json["name"],
      nameEn: json["name_en"],
      nameTranslation: json["name_translation"],
      words: json["words"],
      letters: json["letters"],
      type: json["type"],
      typeEn: json["type_en"],
      ar: json["ar"],
      array: array,
    );
  }
}

class QuranArrayModel {
  int id;
  String ar;
  String en;
  String filename;
  String path;
  String dir;
  int size;

  QuranArrayModel({
    required this.id,
    required this.ar,
    required this.en,
    required this.filename,
    required this.path,
    required this.dir,
    required this.size,
  });

  factory QuranArrayModel.fromJson(Map<String, dynamic> json) {
    return QuranArrayModel(
      id: json["id"],
      ar: json["ar"],
      en: json["en"],
      filename: json["filename"],
      path: json["path"],
      dir: json["dir"],
      size: json["size"],
    );
  }
}
