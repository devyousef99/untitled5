import 'package:json_annotation/json_annotation.dart';
import 'package:untitled5/HTTP/user.dart';


part 'single_user_reponse.g.dart';

@JsonSerializable()
class SingleUserResponse{

  SingleUserResponse();

  @JsonKey(name : "data")
  User user;

  factory SingleUserResponse.fromJson(Map<String, dynamic> json) => _$SingleUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SingleUserResponseToJson(this);

}