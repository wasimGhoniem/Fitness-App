enum GoalEnum {
  loseWeight,
  gainWeight,
  getFitter,
  gainMoreFlexible,
  learnTheBasic,
}

extension GoalEnumExtension on GoalEnum {
  String get displayName {
    switch (this) {
      case GoalEnum.loseWeight:
        return 'Lose Weight';
      case GoalEnum.gainWeight:
        return 'Gain Weight';
      case GoalEnum.getFitter:
        return 'Get Fitter';
      case GoalEnum.gainMoreFlexible:
        return 'Gain More Flexible';
      case GoalEnum.learnTheBasic:
        return 'Learn The Basic';
    }
  }

  String get apiValue {
    return name;
  }

  static GoalEnum fromApiValue(String value) {
    return GoalEnum.values.firstWhere(
          (e) => e.apiValue.toLowerCase() == value.toLowerCase(),
      orElse: () => GoalEnum.loseWeight,
    );
  }
}