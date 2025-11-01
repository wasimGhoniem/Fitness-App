import 'package:fitness_app/features/food/api/model/meal_category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meals_categories_response_dto.g.dart';

@JsonSerializable()
class MealsCategoriesResponseDto {

  MealsCategoriesResponseDto ({
    this.categories,
  });

  factory MealsCategoriesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$MealsCategoriesResponseDtoFromJson(json);
  }
  @JsonKey(name: 'categories')
  final List<MealCategoryDto>? categories;

  Map<String, dynamic> toJson() {
    return _$MealsCategoriesResponseDtoToJson(this);
  }
}




