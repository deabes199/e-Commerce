import 'package:dio/dio.dart';
import 'package:hero_store_app/core/networking/api/api_constant.dart';
import 'package:hero_store_app/features/products/data/models/category_model.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseURL)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  @GET( '${ApiConstant.allProducts}${ApiConstant.allCategories}')
  Future<List<CategoryModel>> getAllCategories();

  @GET('${ApiConstant.allProducts}${ApiConstant.getProductById}')
  Future<ProductModel> getProductByCategoryId(
      @Path('categoryName') String categoryName);

  @GET(ApiConstant.allProducts)
  Future<ProductModel> getAllProduct({
    @Query('limit') int limit = 10,
    @Query('skip') int skip = 0,
  });

  @GET('${ApiConstant.allProducts}${ApiConstant.searchProductByName}')
  Future<ProductModel> searchByName(@Path('title') String title);
}
