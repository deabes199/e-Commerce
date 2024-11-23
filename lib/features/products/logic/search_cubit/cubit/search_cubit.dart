import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/products/data/repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchproductCubit extends Cubit<SearchProductState> {
  SearchproductCubit(this.productsRepo) : super(SearchInitial());
  final ProductsRepo productsRepo;
  TextEditingController search = TextEditingController();
  List<Product> productList = [];

  searchByName(String name) async {
    emit(SearchLoading());
    final response = await productsRepo.searchByName(name);
    response.fold((error) {
      emit(SearchFaliure(message: error.message));
    }, (product) {
      emit(SearchSuccess(
          productList: product.products
              .where((product) =>
                  product.title!.toLowerCase().startsWith(name.toLowerCase()))
              .toList()));
    });
  }
}
