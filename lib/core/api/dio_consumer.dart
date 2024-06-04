
import 'package:dio/dio.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/api_interceptors.dart';
import 'package:quotes/core/api/endpoint.dart';
import 'package:quotes/core/errors/exceptions.dart';


class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({
    required this.dio,
  }) : super(dio) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParamters,
    isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParamters,
      );
      return response.data;
    } on DioException catch (e) {
      
   
        handleDioExceptions(e);
      
    }
  }

  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParamters,
    isFormData = false,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParamters,
      );
      return response.data;
    } on DioException catch (e) {
      
        handleDioExceptions(e);
      
        
      
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParamters,
    isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParamters,
      );
      return response.data;
    } on DioException catch (e) {
        handleDioExceptions(e);
      
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParamters,
    isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParamters,
      );
      return response.data;
    } on DioException catch (e) {
      
        handleDioExceptions(e);
      
    }
  }
}
