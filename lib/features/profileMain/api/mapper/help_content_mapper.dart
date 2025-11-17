import 'package:fitness_app/features/profileMain/api/models/help_content_model.dart';
import 'package:fitness_app/features/profileMain/api/models/localized_models.dart';
import 'package:fitness_app/features/profileMain/domain/entities/help_entity.dart';

extension HelpContentModelMapper on HelpContentModel {
  HelpContentEntity toEntity() {
    return HelpContentEntity(
      pageTitle: pageTitle?.toEntity(),
      pageSubtitle: pageSubtitle?.toEntity(),
      contacts:
          contacts?.map((ContactMethodModel e) => e.toEntity()).toList(),
      faqs: faqs?.map((FaqItemModel e) => e.toEntity()).toList(),
    );
  }
}

extension ContactMethodModelMapper on ContactMethodModel {
  ContactMethodEntity toEntity() {
    return ContactMethodEntity(
      id: id,
      method: method?.toEntity(),
      details: details?.toEntity(),
      value: value,
      style: style?.toEntity(),
    );
  }
}

extension ContactStyleModelMapper on ContactStyleModel {
  ContactStyle toEntity() {
    return ContactStyle(
      method: method?.toEntity(),
      details: details?.toEntity(),
    );
  }
}

extension ContactStyleTextModelMapper on ContactStyleTextModel {
  ContactStyleText toEntity() {
    return ContactStyleText(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

extension FaqItemModelMapper on FaqItemModel {
  FaqItemEntity toEntity() {
    return FaqItemEntity(
      id: id,
      question: question?.toEntity(),
      answer: answer?.toEntity(),
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

