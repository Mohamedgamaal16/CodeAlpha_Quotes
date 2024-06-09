class AuthErrorModel {
  final String status;
  final String message;

  AuthErrorModel({
    required this.status,
    required this.message,
  });

  factory AuthErrorModel.fromJson(Map<String, dynamic> json) {
    return AuthErrorModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
