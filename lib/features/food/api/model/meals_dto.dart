import 'package:json_annotation/json_annotation.dart';
part 'meals_dto.g.dart';

@JsonSerializable()
class MealsDto {

  MealsDto ({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory MealsDto.fromJson(Map<String, dynamic> json) {
    return _$MealsDtoFromJson(json);
  }
  @JsonKey(name: 'strMeal')
  final String? strMeal;
  @JsonKey(name: 'strMealThumb')
  final String? strMealThumb;
  @JsonKey(name: 'idMeal')
  final String? idMeal;

  Map<String, dynamic> toJson() {
    return _$MealsDtoToJson(this);
  }
}