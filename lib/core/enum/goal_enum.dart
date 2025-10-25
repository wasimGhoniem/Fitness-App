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
}
