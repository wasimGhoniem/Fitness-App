enum ActivityLevel { rookie, beginner, intermediate, advance, trueBeast }

extension ActivityLevelExtension on ActivityLevel {
  String get displayName {
    switch (this) {
      case ActivityLevel.rookie:
        return 'Rookie';
      case ActivityLevel.beginner:
        return 'Beginner';
      case ActivityLevel.intermediate:
        return 'Intermediate';
      case ActivityLevel.advance:
        return 'Advance';
      case ActivityLevel.trueBeast:
        return 'True Beast';
    }
  }

  String get apiValue {
    switch (this) {
      case ActivityLevel.rookie:
        return 'level1';
      case ActivityLevel.beginner:
        return 'level2';
      case ActivityLevel.intermediate:
        return 'level3';
      case ActivityLevel.advance:
        return 'level4';
      case ActivityLevel.trueBeast:
        return 'level5';
    }
  }
}
