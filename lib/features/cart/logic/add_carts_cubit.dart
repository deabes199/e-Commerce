import 'package:bloc/bloc.dart';
import 'package:hero_store_app/core/helpers/flutter_secure_stoarge.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'add_carts_state.dart';

class AddCartsCubit extends Cubit<AddCartsState> {
  AddCartsCubit() : super(AddCartsInitial());
  SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  List<Product> cartList = [];
  int quantity = 1;

  bool isProductInCart({required Product product}) {
    if (cartList.where((element) => element.id == product.id).isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void addCart({required Product product}) async {
    if (isProductInCart(product: product)) {
      cartList.removeWhere((element) => element.id == product.id);
      secureStorageHelper.setProductToCart(cartList);
      emit(RemoveProductToCartSuccess());
    } else {
      cartList.add(product);
      secureStorageHelper.setProductToCart(cartList);
      emit(AddProductToCartSuccess());
    }
  }

  void getCarts() async {
    List<Product> carts = await secureStorageHelper.getProductToCart();
    cartList = carts;
    emit(AddCartLoaded());
  }

  void removeCart({required Product product}) async {
    cartList.remove(product);
    secureStorageHelper.setProductToCart(cartList);
    emit(RemoveProductToCartSuccess());
  }

  clearFromCart() async {
    cartList.clear();
    secureStorageHelper.setProductToCart(cartList);
    emit(ClearCartSuccess());
  }

  void quantityPlus(Product product) async {
    if (quantity >= 1) {
      
      quantity++;
    }
    emit(CartChange());
  }

  void quantityMinus(Product product) async {
    if (quantity > 1) {

      quantity--;
    }
    emit(CartChange());
  }

  int getTotalQuantity() {
    int totalQuantity = 0;
    for (var element in cartList) {
      totalQuantity += element.id ?? 0;
      totalQuantity = quantity;
    }
    return totalQuantity;
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var element in cartList) {
      totalPrice += element.price ?? 0 * quantity;
    }
    return totalPrice;
  }
}
