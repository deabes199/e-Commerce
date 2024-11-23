part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class ProductDetailsInitial extends FavoritesState {}

final class AddProductToFavoritesSuccess extends FavoritesState {}

final class RemoveProductToFavoritesSuccess extends FavoritesState {}

// final class AddProductToCartSuccess extends ProductDetailsState {}

// final class RemoveProductToCartSuccess extends ProductDetailsState {}

final class FavoritesLoaded extends FavoritesState {}

final class ClearFavorites extends FavoritesState {}
