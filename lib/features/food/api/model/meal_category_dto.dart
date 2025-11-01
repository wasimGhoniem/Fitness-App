import 'package:json_annotation/json_annotation.dart';

part 'meal_category_dto.g.dart';

@JsonSerializable()
class MealCategoryDto {

  MealCategoryDto({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory MealCategoryDto.fromJson(Map<String, dynamic> json) {
    return _$MealCategoryDtoFromJson(json);
  }
  @JsonKey(name: 'idCategory')
  final String? idCategory;
  @JsonKey(name: 'strCategory')
  final String? strCategory;
  @JsonKey(name: 'strCategoryThumb')
  final String? strCategoryThumb;
  @JsonKey(name: 'strCategoryDescription')
  final String? strCategoryDescription;

  Map<String, dynamic> toJson() {
    return _$MealCategoryDtoToJson(this);
  }
}
