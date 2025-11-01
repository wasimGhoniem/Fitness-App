import 'package:fitness_app/features/food/api/model/meals_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meals_by_category_response_dto.g.dart';

@JsonSerializable()
class MealsByCategoryResponseDto {
  MealsByCategoryResponseDto({this.meals});

  factory MealsByCategoryResponseDto.fromJson(Map<String, dynamic> json) {
    return _$MealsByCategoryResponseDtoFromJson(json);
  }

  @JsonKey(name: 'meals')
  final List<MealsDto>? meals;

  Map<String, dynamic> toJson() {
    return _$MealsByCategoryResponseDtoToJson(this);
  }
}
