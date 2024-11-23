import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hero_store_app/core/networking/api/api_error_handler.dart';
import 'package:hero_store_app/core/networking/api/api_services.dart';
import 'package:hero_store_app/core/networking/error_model.dart';
import 'package:hero_store_app/features/products/data/models/category_model.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class ProductsRepo {
  final ApiServices apiServices;

  ProductsRepo(this.apiServices);

  Future<Either<ErrorModel, List<CategoryModel>>> getAllCategory() async {
    try {
      var response = await apiServices.getAllCategories();
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ApiErrorHandler.fromDioError(error));
      } else {
        return left(ErrorModel(error.toString()));
      }
    }
  }

  Future<Either<ErrorModel, ProductModel>> getProductById(
      String categoryName) async {
    try {
      var response = await apiServices.getProductByCategoryId(categoryName);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ApiErrorHandler.fromDioError(error));
      } else {
        return left(ErrorModel(error.toString()));
      }
    }
  }

  Future<Either<ErrorModel, ProductModel>> searchByName(String name) async {
    try {
      final response = await apiServices.searchByName(name);
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
