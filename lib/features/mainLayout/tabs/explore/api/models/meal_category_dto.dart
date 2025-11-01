import 'package:json_annotation/json_annotation.dart';

part 'meal_category_dto.g.dart';

@JsonSerializable()
class MealCategoryDto {
  factory MealCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$MealCategoryDtoFromJson(json);

  MealCategoryDto({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  @JsonKey(name: 'idCategory')
  final String? idCategory;

  @JsonKey(name: 'strCategory')
  final String? strCategory;

  @JsonKey(name: 'strCategoryThumb')
  final String? strCategoryThumb;

  @JsonKey(name: 'strCategoryDescription')
  final String? strCategoryDescription;

  Map<String, dynamic> toJson() => _$MealCategoryDtoToJson(this);
}
