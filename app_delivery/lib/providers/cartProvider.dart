import 'package:app_delivery/models/productModel.dart';
import 'package:app_delivery/services/cartService.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final CartService _cartService;
  CartProvider() : _cartService = CartService();

  List<ProductModel> get items => _cartService.getCartItems();

  double get totalPrice => _cartService.getTotalPrice();

  void addQtd(int id) {
    _cartService.addQtd(id);

    notifyListeners();
  }

  void removeQtd(int id) {
    _cartService.removeQtd(id);

    notifyListeners();
  }

  void getTotalPrice() {
    _cartService.getTotalPrice();
    notifyListeners();
  }

  void addProduct(ProductModel product) {
    _cartService.addProduct(product);
    notifyListeners();
  }

  void removeProduct(int id) {
    _cartService.removeProduct(id);
    notifyListeners();
  }

  void clearCart() {
    _cartService.clearCart();
    notifyListeners();
  }
}
