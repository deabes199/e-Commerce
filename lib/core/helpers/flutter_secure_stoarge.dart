import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class SecureStorageHelper {
  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : getSecuredString with key : $key');
    return await flutterSecureStorage.read(key: key) ?? "";
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }

  // set list of favorites to local
  setFavorites(List<Product> favorites) async {
    const flutterSecureStorage = FlutterSecureStorage();
    List<Map<String, dynamic>> mappedList =
        favorites.map((e) => e.toJson()).toList();
    String? encodedFavorites = json.encode(mappedList);
    debugPrint('set favorites with values >>>> $encodedFavorites');
    await flutterSecureStorage.write(key: 'favorites', value: encodedFavorites);
  }

// get list of favorites from local
  Future<List<Product>> getFavorites() async {
    const flutterSecureStorage = FlutterSecureStorage();
    String? encodedFavorites =
        await flutterSecureStorage.read(key: 'favorites');
    debugPrint('get favorites with values >>>> $encodedFavorites');
    if (encodedFavorites != null) {
      List<dynamic> decodedFavorites = json.decode(encodedFavorites);

      List<Product> favorites =
          decodedFavorites.map((e) => Product.fromJson(e)).toList();
      return favorites;
    } else {
      return [];
    }
  }

  // set list of cart items to local
  setProductToCart(List<Product> cartItems) async {
    const flutterSecureStorage = FlutterSecureStorage();
    List<Map<String, dynamic>> mappedList =
        cartItems.map((e) => e.toJson()).toList();
    String? encodedCart = json.encode(mappedList);
    debugPrint('set Carts with values >>>> $encodedCart');
    await flutterSecureStorage.write(key: 'carts', value: encodedCart);
  }

  // get list of cart items from local
  Future<List<Product>> getProductToCart() async {
    const flutterSecureStorage = FlutterSecureStorage();
    String? encodedCart = await flutterSecureStorage.read(key: 'carts');
    debugPrint('get carts with values >>>> $encodedCart');
    if (encodedCart != null) {
      List<dynamic> decodedCart = json.decode(encodedCart);
      List<Product> cartList =
          decodedCart.map((e) => Product.fromJson(e)).toList();
      return cartList;
    } else {
      return [];
    }
  }

 
}
