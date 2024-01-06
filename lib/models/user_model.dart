class User {
  final int id;
  final UserInformation userInformation;

  User({
    required this.id,
    required this.userInformation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      userInformation: UserInformation.fromJson(json['user_information']),
    );
  }
}

class UserInformation {
  int id;
  String? userName;
  String? userAvatarPath;
  String? userPhoneNumber;
  String? userEmail;

  UserInformation({
    required this.id,
    required this.userName,
    this.userAvatarPath,
    required this.userPhoneNumber,
    required this.userEmail,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return UserInformation(
      id: json['id'] as int,
      userName: json['user_name'] as String?,
      userAvatarPath: json['user_avatar_path'] as String?,
      userPhoneNumber: json['user_phone_number'] as String?,
      userEmail: json['user_email'] as String?,
    );
  }
}
