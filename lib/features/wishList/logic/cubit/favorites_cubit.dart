import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/flutter_secure_stoarge.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(ProductDetailsInitial());

  SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  List<Product> favorites = [];
  void addFavorite({required Product product}) async {
    if (isProductInFavorites(product: product)) {
      favorites.removeWhere((element) => element.id == product.id);
      secureStorageHelper.setFavorites(favorites);

      emit(RemoveProductToFavoritesSuccess());
    } else {
      favorites.add(product);
      secureStorageHelper.setFavorites(favorites);
      emit(AddProductToFavoritesSuccess());
    }
  }

  bool isProductInFavorites({required Product product}) {
    if (favorites.where((element) => element.id == product.id).isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void getFavorites() async {
    List<Product> savedFavorites = await secureStorageHelper.getFavorites();
    favorites = savedFavorites;
    emit(FavoritesLoaded());
  }

  void removeFavorite({required Product product}) async {
    favorites.remove(product);
    secureStorageHelper.setFavorites(favorites);
    emit(RemoveProductToFavoritesSuccess());
  }

  void clearFavorites() async {
    favorites.clear();
    secureStorageHelper.setFavorites(favorites);
    emit(ClearFavorites());
  }
}
