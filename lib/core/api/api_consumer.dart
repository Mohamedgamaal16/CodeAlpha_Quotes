import 'package:dio/dio.dart';

abstract class ApiConsumer {
  ApiConsumer(Dio dio);

  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParamters,
    bool isFormData = false,
  });
  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParamters,
    bool isFormData = false,
  });
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParamters,
    bool isFormData = false,
  });
  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParamters,
    bool isFormData = false,
  });
}
