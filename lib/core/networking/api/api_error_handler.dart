import 'package:dio/dio.dart';
import 'package:hero_store_app/core/networking/error_model.dart';

class ApiErrorHandler extends ErrorModel {
  ApiErrorHandler(super.message);
  factory ApiErrorHandler.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorHandler('Connection time out with api server');
      case DioExceptionType.sendTimeout:
        return ApiErrorHandler('Send time out with api server');
      case DioExceptionType.receiveTimeout:
        return ApiErrorHandler('Receive time out with api server');
      case DioExceptionType.badCertificate:
        return ApiErrorHandler('Internal Server Error');
      case DioExceptionType.badResponse:
        return ApiErrorHandler.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ApiErrorHandler('Request to api server was canceled');
      case DioExceptionType.connectionError:
        return ApiErrorHandler('No Internet Connection');
      case DioExceptionType.unknown:
        return ApiErrorHandler('Connection Error');

      default:
        return ApiErrorHandler('Opps There was an error, Please Try Again');
    }
  }
  factory ApiErrorHandler.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ApiErrorHandler('Your request not found, please try Later');
    } else if (statusCode == 500) {
      return ApiErrorHandler('Internal Server Error, Please Try Later');
    } else {
      return ApiErrorHandler('Opps There was an error, Please Try Again');
    }
  }
}
