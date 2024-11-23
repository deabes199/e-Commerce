part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetProductLoading extends HomeState {}
final class GetProductPaginationLoading extends HomeState {}

final class GetProductSuccess extends HomeState {

}

final class GetProductFaliure extends HomeState {
  final String message;

  GetProductFaliure({required this.message});
}
