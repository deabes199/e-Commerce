part of 'add_carts_cubit.dart';

@immutable
sealed class AddCartsState {}

final class AddCartsInitial extends AddCartsState {}

final class AddProductToCartSuccess extends AddCartsState {}

final class RemoveProductToCartSuccess extends AddCartsState {}

final class AddCartLoaded extends AddCartsState {}

final class ClearCartSuccess extends AddCartsState {}

final class CartChange extends AddCartsState {}
