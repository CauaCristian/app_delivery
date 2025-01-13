import 'package:app_delivery/models/productModel.dart';
import 'package:app_delivery/repositories/cartRepository.dart';

class CartService {
  final CartRepository _cartRepository;

  CartService() : _cartRepository = CartRepository();

  List<ProductModel> getCartItems() {
    return _cartRepository.getCartItems();
  }

  double getTotalPrice() {
    return _cartRepository.getTotalPrice();
  }

  int getQtd(int id) {
    return _cartRepository.getQtd(id);
  }

  void addQtd(int id) {
    _cartRepository.addQtd(id);
  }

  void removeQtd(int id) {
    _cartRepository.removeQtd(id);
  }

  void addProduct(ProductModel product) {
    _cartRepository.addToCart(product);
  }

  void removeProduct(int id) {
    _cartRepository.removeFromCart(id);
  }

  void clearCart() {
    _cartRepository.clearCart();
  }
}
