import 'package:fitness_app/features/profileMain/api/models/localized_models.dart';
import 'package:fitness_app/features/profileMain/api/models/privacy_policy_model.dart';
import 'package:fitness_app/features/profileMain/domain/entities/privacy_policy_entity.dart';

extension PrivacyPolicyModelMapper on PrivacyPolicyModel {
  PrivacyPolicyEntity toEntity() {
    return PrivacyPolicyEntity(
      title: title?.toEntity(),
      lastUpdated: lastUpdated?.toEntity(),
      introduction: introduction?.toEntity(),
      informationCollection: informationCollection?.toEntity(),
      howWeUseInfo: howWeUseInfo?.toEntity(),
      howWeShareInfo: howWeShareInfo?.toEntity(),
      dataSecurity: dataSecurity?.toEntity(),
      dataRights: dataRights?.toEntity(),
      childrensPrivacy: childrensPrivacy?.toEntity(),
      changesToPolicy: changesToPolicy?.toEntity(),
      contactUs: contactUs?.toEntity(),
    );
  }
}

extension InformationCollectionSectionModelMapper
    on InformationCollectionSectionModel {
  InformationCollectionSectionEntity toEntity() {
    return InformationCollectionSectionEntity(
      title: title?.toEntity(),
      subSections:
          subSections?.map((PolicyParagraphSubSectionModel e) => e.toEntity()).toList(),
    );
  }
}

extension PolicyParagraphSubSectionModelMapper
    on PolicyParagraphSubSectionModel {
  PolicyParagraphSubSection toEntity() {
    return PolicyParagraphSubSection(
      type: type,
      title: title?.toEntity(),
      content: content?.toEntity(),
    );
  }
}

extension TitledListSectionModelMapper on TitledListSectionModel {
  TitledListSectionEntity toEntity() {
    return TitledListSectionEntity(
      title: title?.toEntity(),
      items: items?.toEntity(),
    );
  }
}

extension SingleParagraphSectionModelMapper on SingleParagraphSectionModel {
  SingleParagraphSectionEntity toEntity() {
    return SingleParagraphSectionEntity(
      title: title?.toEntity(),
      items: items?.toEntity(),
    );
  }
}

extension LocalizedTextModelMapper on LocalizedTextModel {
  LocalizedText toEntity() {
    return LocalizedText(
      en: en,
      ar: ar,
    );
  }
}

extension LocalizedListModelMapper on LocalizedListModel {
  LocalizedList toEntity() {
    return LocalizedList(
      en: en,
      ar: ar,
    );
  }
}

