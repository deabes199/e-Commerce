import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hero_store_app/core/networking/api/api_error_handler.dart';
import 'package:hero_store_app/core/networking/api/api_services.dart';
import 'package:hero_store_app/core/networking/error_model.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class HomeRepo {
  final ApiServices apiServices;

  HomeRepo(this.apiServices);

  Future<Either<ErrorModel, ProductModel>> getAllproduct({required int limit, required int skip}) async {
    try {
      final response = await apiServices.getAllProduct(limit: limit, skip: skip);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ApiErrorHandler.fromDioError(error));
      } else {
        return left(ErrorModel(error.toString()));
      }
    }
  }
}
