


class ChangePasswordModel {
  final String status;
  final String message;

  ChangePasswordModel({required this.status, required this.message});

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
