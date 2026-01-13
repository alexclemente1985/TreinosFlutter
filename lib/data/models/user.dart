import 'package:signin_signup_logout/domain/entities/user.dart';

class UserModel {
  final String role;
  final String username;

  UserModel({
    required this.role,
    required this.username
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      role: map['role'] as String,
      username: map['username'] as String
    );
  }
}

  extension UserXModel on UserModel {
    UserEntity toEntity(){
      return UserEntity(
        role: role, 
        username: username
      );
    }
  }