import 'package:dio/dio.dart';
import 'package:quotes/core/errors/models/auth_error_model.dart';
import 'package:quotes/core/errors/models/erro_model.dart';

class QuoteServerException implements Exception {
  final ErrorModel errModel;

  QuoteServerException({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw QuoteServerException(
          errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw QuoteServerException(
          errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw QuoteServerException(
          errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw QuoteServerException(
          errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw QuoteServerException(
          errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw QuoteServerException(
          errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw QuoteServerException(
          errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw QuoteServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw QuoteServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw QuoteServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 404: //not found
          throw QuoteServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 409: //cofficient
          throw QuoteServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 422: //  Unprocessable Entity
          throw QuoteServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 504: // Server exception
          throw QuoteServerException(
              errModel: ErrorModel(
                  message: 'Server connectivity issues',status: "504"));
      }
  }
}

//Auth

class AuthServerException implements Exception {
  final AuthErrorModel errModel;

  AuthServerException({required this.errModel});
}

void handleAuthDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw AuthServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw AuthServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw AuthServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw AuthServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw AuthServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw AuthServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw AuthServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw AuthServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw AuthServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw AuthServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 404: //not found
          throw AuthServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 409: //cofficient
          throw AuthServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 422: //  Unprocessable Entity
          throw AuthServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 504: // Server exception
          throw AuthServerException(
              errModel: AuthErrorModel(
                  message: 'Server connectivity issues',status: "504"));
      }
  }
}
