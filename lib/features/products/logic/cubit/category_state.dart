part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryModel> categoryList;

  CategorySuccess({required this.categoryList});
}

final class CategoryFaliure extends CategoryState {
  final String message;

  CategoryFaliure({required this.message});
}



final class ProductLoading extends CategoryState {}

final class ProductSuccess extends CategoryState {
  final ProductModel productList;

  ProductSuccess({required this.productList});
}

final class ProductFaliure extends CategoryState {
  final String message;

  ProductFaliure({required this.message});
}




