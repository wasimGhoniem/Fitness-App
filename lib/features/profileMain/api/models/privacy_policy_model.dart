import 'package:fitness_app/features/profileMain/api/models/localized_models.dart';

class PrivacyPolicyModel {
  const PrivacyPolicyModel({
    this.title,
    this.lastUpdated,
    this.introduction,
    this.informationCollection,
    this.howWeUseInfo,
    this.howWeShareInfo,
    this.dataSecurity,
    this.dataRights,
    this.childrensPrivacy,
    this.changesToPolicy,
    this.contactUs,
  });

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> sections =
        json['privacy_policy'] as List<dynamic>? ?? <dynamic>[];

    LocalizedTextModel? title;
    LocalizedTextModel? lastUpdated;
    LocalizedTextModel? introduction;
    InformationCollectionSectionModel? informationCollection;
    TitledListSectionModel? howWeUseInfo;
    TitledListSectionModel? howWeShareInfo;
    SingleParagraphSectionModel? dataSecurity;
    TitledListSectionModel? dataRights;
    SingleParagraphSectionModel? childrensPrivacy;
    TitledListSectionModel? changesToPolicy;
    TitledListSectionModel? contactUs;

    for (final dynamic entry in sections) {
      if (entry is! Map<String, dynamic>) continue;

      final String? section = entry['section'] as String?;

      switch (section) {
        case 'title':
          title = LocalizedTextModel.fromJson(
            entry['content'] as Map<String, dynamic>?,
          );
          break;
        case 'last_updated':
          lastUpdated = LocalizedTextModel.fromJson(
            entry['content'] as Map<String, dynamic>?,
          );
          break;
        case 'introduction':
          introduction = LocalizedTextModel.fromJson(
            entry['content'] as Map<String, dynamic>?,
          );
          break;
        case 'information_collection':
          informationCollection = InformationCollectionSectionModel.fromJson(
            entry,
          );
          break;
        case 'how_we_use_info':
          howWeUseInfo = TitledListSectionModel.fromJson(entry);
          break;
        case 'how_we_share_info':
          howWeShareInfo = TitledListSectionModel.fromJson(entry);
          break;
        case 'data_security':
          dataSecurity = SingleParagraphSectionModel.fromJson(entry);
          break;
        case 'data_rights':
          dataRights = TitledListSectionModel.fromJson(entry);
          break;
        case 'childrens_privacy':
          childrensPrivacy = SingleParagraphSectionModel.fromJson(entry);
          break;
        case 'changes_to_policy':
          changesToPolicy = TitledListSectionModel.fromJson(entry);
          break;
        case 'contact_us':
          contactUs = TitledListSectionModel.fromJson(entry);
          break;
        default:
          break;
      }
    }

    return PrivacyPolicyModel(
      title: title,
      lastUpdated: lastUpdated,
      introduction: introduction,
      informationCollection: informationCollection,
      howWeUseInfo: howWeUseInfo,
      howWeShareInfo: howWeShareInfo,
      dataSecurity: dataSecurity,
      dataRights: dataRights,
      childrensPrivacy: childrensPrivacy,
      changesToPolicy: changesToPolicy,
      contactUs: contactUs,
    );
  }

  final LocalizedTextModel? title;
  final LocalizedTextModel? lastUpdated;
  final LocalizedTextModel? introduction;
  final InformationCollectionSectionModel? informationCollection;
  final TitledListSectionModel? howWeUseInfo;
  final TitledListSectionModel? howWeShareInfo;
  final SingleParagraphSectionModel? dataSecurity;
  final TitledListSectionModel? dataRights;
  final SingleParagraphSectionModel? childrensPrivacy;
  final TitledListSectionModel? changesToPolicy;
  final TitledListSectionModel? contactUs;
}

class InformationCollectionSectionModel {
  const InformationCollectionSectionModel({this.title, this.subSections});

  factory InformationCollectionSectionModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final List<dynamic> subSectionsJson =
        json['sub_sections'] as List<dynamic>? ?? <dynamic>[];

    return InformationCollectionSectionModel(
      title: LocalizedTextModel.fromJson(
        json['title'] as Map<String, dynamic>?,
      ),
      subSections: subSectionsJson
          .whereType<Map<String, dynamic>>()
          .map(PolicyParagraphSubSectionModel.fromJson)
          .toList(),
    );
  }

  final LocalizedTextModel? title;
  final List<PolicyParagraphSubSectionModel>? subSections;
}

class PolicyParagraphSubSectionModel {
  const PolicyParagraphSubSectionModel({this.type, this.title, this.content});

  factory PolicyParagraphSubSectionModel.fromJson(Map<String, dynamic> json) {
    return PolicyParagraphSubSectionModel(
      type: json['type'] as String?,
      title: LocalizedTextModel.fromJson(
        json['title'] as Map<String, dynamic>?,
      ),
      content: LocalizedTextModel.fromJson(
        json['content'] as Map<String, dynamic>?,
      ),
    );
  }

  final String? type;
  final LocalizedTextModel? title;
  final LocalizedTextModel? content;
}

class TitledListSectionModel {
  const TitledListSectionModel({this.title, this.items});

  factory TitledListSectionModel.fromJson(Map<String, dynamic> json) {
    return TitledListSectionModel(
      title: LocalizedTextModel.fromJson(
        json['title'] as Map<String, dynamic>?,
      ),
      items: LocalizedListModel.fromJson(
        json['content'] as Map<String, dynamic>?,
      ),
    );
  }

  final LocalizedTextModel? title;
  final LocalizedListModel? items;
}

class SingleParagraphSectionModel {
  const SingleParagraphSectionModel({this.title, this.items});

  factory SingleParagraphSectionModel.fromJson(Map<String, dynamic> json) {
    return SingleParagraphSectionModel(
      title: LocalizedTextModel.fromJson(
        json['title'] as Map<String, dynamic>?,
      ),
      items: LocalizedListModel.fromJson(
        json['content'] as Map<String, dynamic>?,
      ),
    );
  }

  final LocalizedTextModel? title;
  final LocalizedListModel? items;
}
