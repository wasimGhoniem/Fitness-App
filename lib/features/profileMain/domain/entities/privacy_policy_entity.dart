class LocalizedText {
  const LocalizedText({
    this.en,
    this.ar,
  });

  final String? en;
  final String? ar;
}

class LocalizedList {
  const LocalizedList({
    this.en,
    this.ar,
  });

  final List<String>? en;
  final List<String>? ar;
}

class PolicyParagraphSubSection {
  const PolicyParagraphSubSection({
    this.type,
    this.title,
    this.content,
  });

  final String? type;
  final LocalizedText? title;
  final LocalizedText? content;
}

class InformationCollectionSectionEntity {
  const InformationCollectionSectionEntity({
    this.title,
    this.subSections,
  });

  final LocalizedText? title;
  final List<PolicyParagraphSubSection>? subSections;
}

class TitledListSectionEntity {
  const TitledListSectionEntity({
    this.title,
    this.items,
  });

  final LocalizedText? title;
  final LocalizedList? items;
}

class SingleParagraphSectionEntity {
  const SingleParagraphSectionEntity({
    this.title,
    this.items,
  });

  final LocalizedText? title;
  final LocalizedList? items;
}

class PrivacyPolicyEntity {
  const PrivacyPolicyEntity({
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

  final LocalizedText? title;
  final LocalizedText? lastUpdated;
  final LocalizedText? introduction;
  final InformationCollectionSectionEntity? informationCollection;
  final TitledListSectionEntity? howWeUseInfo;
  final TitledListSectionEntity? howWeShareInfo;
  final SingleParagraphSectionEntity? dataSecurity;
  final TitledListSectionEntity? dataRights;
  final SingleParagraphSectionEntity? childrensPrivacy;
  final TitledListSectionEntity? changesToPolicy;
  final TitledListSectionEntity? contactUs;
}


