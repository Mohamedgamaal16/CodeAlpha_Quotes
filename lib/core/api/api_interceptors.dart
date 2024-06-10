import 'package:dio/dio.dart';
import 'package:quotes/core/api/endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
             final prefs = await SharedPreferences.getInstance();
    options.headers['Authorization'] = prefs.getString(ApiKey.token) != null
        ? 'Bearer ${prefs.getString(ApiKey.token)}'
        : null;


    super.onRequest(options, handler);
  }
}
