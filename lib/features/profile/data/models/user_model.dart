class UserModel {
  final UserData data;

  UserModel({required this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final User user;

  UserData({required this.user});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final int v;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      v: json['__v'],
    );
  }
}
