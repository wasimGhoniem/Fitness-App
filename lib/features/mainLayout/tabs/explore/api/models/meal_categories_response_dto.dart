import 'package:json_annotation/json_annotation.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/meal_category_dto.dart';

part 'meal_categories_response_dto.g.dart';

@JsonSerializable()
class MealCategoriesResponseDto {
  factory MealCategoriesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MealCategoriesResponseDtoFromJson(json);

  MealCategoriesResponseDto({this.categories});

  @JsonKey(name: 'categories')
  final List<MealCategoryDto>? categories;

  Map<String, dynamic> toJson() => _$MealCategoriesResponseDtoToJson(this);
}
