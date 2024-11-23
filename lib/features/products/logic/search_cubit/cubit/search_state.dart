part of 'search_cubit.dart';

@immutable
sealed class SearchProductState {}

final class SearchInitial extends SearchProductState {}

final class SearchLoading extends SearchProductState {}

final class SearchSuccess extends SearchProductState {
  final List<Product> productList;

  SearchSuccess({required this.productList});
}

final class SearchFaliure extends SearchProductState {
  final String message;

  SearchFaliure({required this.message});
}
