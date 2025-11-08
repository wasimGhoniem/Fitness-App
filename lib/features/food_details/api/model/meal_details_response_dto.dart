import 'package:fitness_app/features/food_details/api/model/meal_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_details_response_dto.g.dart';

@JsonSerializable()
class MealDetailsResponseDto {
  MealDetailsResponseDto({this.meals});

  factory MealDetailsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$MealDetailsResponseDtoFromJson(json);
  }
  @JsonKey(name: 'meals')
  final List<MealDto>? meals;

  Map<String, dynamic> toJson() {
    return _$MealDetailsResponseDtoToJson(this);
  }
}
