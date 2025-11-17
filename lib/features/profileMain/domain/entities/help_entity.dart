class LocalizedText {
  const LocalizedText({
    this.en,
    this.ar,
  });

  final String? en;
  final String? ar;
}

class ContactStyleText {
  const ContactStyleText({
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  final int? fontSize;
  final String? fontWeight;
  final String? color;
}

class ContactStyle {
  const ContactStyle({
    this.method,
    this.details,
  });

  final ContactStyleText? method;
  final ContactStyleText? details;
}

class ContactMethodEntity {
  const ContactMethodEntity({
    this.id,
    this.method,
    this.details,
    this.value,
    this.style,
  });

  final String? id;
  final LocalizedText? method;
  final LocalizedText? details;
  final String? value;
  final ContactStyle? style;
}

class FaqItemEntity {
  const FaqItemEntity({
    this.id,
    this.question,
    this.answer,
  });

  final String? id;
  final LocalizedText? question;
  final LocalizedText? answer;
}

class HelpContentEntity {
  const HelpContentEntity({
    this.pageTitle,
    this.pageSubtitle,
    this.contacts,
    this.faqs,
  });

  final LocalizedText? pageTitle;
  final LocalizedText? pageSubtitle;
  final List<ContactMethodEntity>? contacts;
  final List<FaqItemEntity>? faqs;
}


