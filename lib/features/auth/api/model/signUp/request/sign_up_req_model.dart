import 'package:json_annotation/json_annotation.dart';

part 'sign_up_req_model.g.dart';

@JsonSerializable()
class SignUpReqModel {
  SignUpReqModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.goal,
    required this.activityLevel,
  });

  factory SignUpReqModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpReqModelFromJson(json);
  }

  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lastName')
  String lastName;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'password')
  String password;
  @JsonKey(name: 'rePassword')
  String rePassword;
  @JsonKey(name: 'gender')
  String gender;
  @JsonKey(name: 'height')
  int height;
  @JsonKey(name: 'weight')
  int weight;
  @JsonKey(name: 'age')
  int age;
  @JsonKey(name: 'goal')
  String goal;
  @JsonKey(name: 'activityLevel')
  String activityLevel;

  Map<String, dynamic> toJson() => _$SignUpReqModelToJson(this);
}
