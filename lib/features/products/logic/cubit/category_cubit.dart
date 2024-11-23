import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hero_store_app/features/products/data/models/category_model.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/products/data/repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.productsRepo) : super(CategoryInitial());
  final ProductsRepo productsRepo;
  
  getCategory() async {
    emit(CategoryLoading());
    final response = await productsRepo.getAllCategory();
    response.fold((error) {
      emit(CategoryFaliure(message: error.message));
    }, (categoryList) {
      getProductById(categoryList.first.name);

      emit(CategorySuccess(categoryList: categoryList));
    });
  }

  getProductById(String categoryName) async {
    emit(ProductLoading());
    final response = await productsRepo.getProductById(categoryName);
    response.fold((error) {
      emit(ProductLoading());
    }, (product) {
      emit(ProductSuccess(productList: product));
    });
  }

 
}
