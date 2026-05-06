import 'package:dio/dio.dart';
import '../../injection_container/injection_container.dart';
import '../local/auth_local_data_source.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async {
      final token = await sharedPreferences.get(cacheTokenConst);

      if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    } else {
      options.cancelToken;
    }
    super.onRequest(options, handler);
  }
}