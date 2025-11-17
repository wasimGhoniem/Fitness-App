

import 'package:fitness_app/features/profileMain/api/models/localized_models.dart';

class HelpContentModel {
  const HelpContentModel({
    this.pageTitle,
    this.pageSubtitle,
    this.contacts,
    this.faqs,
  });

  factory HelpContentModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> sections =
        json['help_screen_content'] as List<dynamic>? ?? <dynamic>[];

    LocalizedTextModel? pageTitle;
    LocalizedTextModel? pageSubtitle;
    final List<ContactMethodModel> contacts = <ContactMethodModel>[];
    final List<FaqItemModel> faqs = <FaqItemModel>[];

    for (final dynamic entry in sections) {
      if (entry is! Map<String, dynamic>) continue;

      final String? section = entry['section'] as String?;

      switch (section) {
        case 'page_title':
          pageTitle = LocalizedTextModel.fromJson(
            entry['content'] as Map<String, dynamic>?,
          );
          break;
        case 'page_subtitle':
          pageSubtitle = LocalizedTextModel.fromJson(
            entry['content'] as Map<String, dynamic>?,
          );
          break;
        case 'contact_us':
          contacts.addAll(_parseContactMethods(entry['content']));
          break;
        case 'faq':
          faqs.addAll(_parseFaqItems(entry['content']));
          break;
        default:
          break;
      }
    }

    return HelpContentModel(
      pageTitle: pageTitle,
      pageSubtitle: pageSubtitle,
      contacts: contacts,
      faqs: faqs,
    );
  }

  final LocalizedTextModel? pageTitle;
  final LocalizedTextModel? pageSubtitle;
  final List<ContactMethodModel>? contacts;
  final List<FaqItemModel>? faqs;

  static List<ContactMethodModel> _parseContactMethods(dynamic content) {
    if (content is List<dynamic>) {
      return content
          .whereType<Map<String, dynamic>>()
          .map(ContactMethodModel.fromJson)
          .toList();
    }
    return <ContactMethodModel>[];
  }

  static List<FaqItemModel> _parseFaqItems(dynamic content) {
    if (content is List<dynamic>) {
      return content
          .whereType<Map<String, dynamic>>()
          .map(FaqItemModel.fromJson)
          .toList();
    }
    return <FaqItemModel>[];
  }
}

class ContactMethodModel {
  const ContactMethodModel({
    this.id,
    this.method,
    this.details,
    this.value,
    this.style,
  });

  factory ContactMethodModel.fromJson(Map<String, dynamic> json) {
    return ContactMethodModel(
      id: json['id'] as String?,
      method: LocalizedTextModel.fromJson(
        json['method'] as Map<String, dynamic>?,
      ),
      details: LocalizedTextModel.fromJson(
        json['details'] as Map<String, dynamic>?,
      ),
      value: json['value'] as String?,
      style: ContactStyleModel.fromJson(json['style'] as Map<String, dynamic>?),
    );
  }

  final String? id;
  final LocalizedTextModel? method;
  final LocalizedTextModel? details;
  final String? value;
  final ContactStyleModel? style;
}

class ContactStyleModel {
  const ContactStyleModel({this.method, this.details});

  factory ContactStyleModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const ContactStyleModel();
    }

    return ContactStyleModel(
      method: ContactStyleTextModel.fromJson(
        json['method'] as Map<String, dynamic>?,
      ),
      details: ContactStyleTextModel.fromJson(
        json['details'] as Map<String, dynamic>?,
      ),
    );
  }

  final ContactStyleTextModel? method;
  final ContactStyleTextModel? details;
}

class ContactStyleTextModel {
  const ContactStyleTextModel({this.fontSize, this.fontWeight, this.color});

  factory ContactStyleTextModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const ContactStyleTextModel();
    }

    return ContactStyleTextModel(
      fontSize: _parseInt(json['fontSize']),
      fontWeight: json['fontWeight'] as String?,
      color: json['color'] as String?,
    );
  }

  final int? fontSize;
  final String? fontWeight;
  final String? color;

  static int? _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return null;
  }
}

class FaqItemModel {
  const FaqItemModel({this.id, this.question, this.answer});

  factory FaqItemModel.fromJson(Map<String, dynamic> json) {
    return FaqItemModel(
      id: json['id'] as String?,
      question: LocalizedTextModel.fromJson(
        json['question'] as Map<String, dynamic>?,
      ),
      answer: LocalizedTextModel.fromJson(
        json['answer'] as Map<String, dynamic>?,
      ),
    );
  }

  final String? id;
  final LocalizedTextModel? question;
  final LocalizedTextModel? answer;
}
