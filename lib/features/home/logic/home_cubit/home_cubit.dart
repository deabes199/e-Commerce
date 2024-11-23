import 'package:bloc/bloc.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  bool isFirstLoading = true;
  List<Product> productList = [];
  getAllProduct({required int limit, required int skip}) async {
    if (isFirstLoading) {
      productList = [];
      emit(GetProductLoading());
      
    } else {
      emit(GetProductPaginationLoading());
    }

    final response = await homeRepo.getAllproduct(limit: limit, skip: skip);
    response.fold(
      (error) {
      emit(GetProductFaliure(message: error.message));
    },
     (product) {
      if (isFirstLoading) {
        productList = product.products;
        isFirstLoading = false;
      }else{
        productList.addAll(product.products);
        productList.toSet().toList();
      }

      emit(GetProductSuccess());
    });
  }
}
