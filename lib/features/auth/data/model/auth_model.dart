class AuthResponseModel
 {
  final String status;
  final String token;

  AuthResponseModel({required this.status, required this.token});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      status: json['status'],
      token: json['token'],
    );
  }
}
