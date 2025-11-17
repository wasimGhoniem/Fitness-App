class LocalizedTextModel {
  const LocalizedTextModel({
    this.en,
    this.ar,
  });

  factory LocalizedTextModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const LocalizedTextModel();
    }

    return LocalizedTextModel(
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );
  }

  final String? en;
  final String? ar;
}

class LocalizedListModel {
  const LocalizedListModel({
    this.en,
    this.ar,
  });

  factory LocalizedListModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const LocalizedListModel();
    }

    return LocalizedListModel(
      en: _parseStringList(json['en']),
      ar: _parseStringList(json['ar']),
    );
  }

  static List<String>? _parseStringList(dynamic value) {
    if (value is List<dynamic>) {
      return value.whereType<String>().toList();
    }
    return null;
  }

  final List<String>? en;
  final List<String>? ar;
}


