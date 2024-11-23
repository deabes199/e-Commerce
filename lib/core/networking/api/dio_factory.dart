import 'package:dio/dio.dart';
import 'package:hero_store_app/core/helpers/app_constant.dart';
import 'package:hero_store_app/core/helpers/flutter_secure_stoarge.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      addDioHeader();

      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeader() async {
    dio?.options.headers = {
      'Accept': '*/*',
      'Authorization':
          'Bearer ${await SecureStorageHelper.getSecuredString(AppConstant.userToken)}'
    };
  }

  static void setTokenAfterLogin(String token) {
    dio?.options.headers = {'Authorization': 'Bearer$token'};
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
