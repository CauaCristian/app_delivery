import 'package:app_delivery/models/productModel.dart';

class CartRepository {
  final List<ProductModel> _cartItems = [];

  List<ProductModel> getCartItems() {
    return _cartItems;
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += _cartItems[i].price * _cartItems[i].qtd;
    }
    return totalPrice;
  }

  int getQtd(int id) {
    for (int i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i].id == id) {
        return _cartItems[i].qtd;
      }
    }
    return 1;
  }

  void addQtd(int id) {
    for (int i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i].id == id) {
        _cartItems[i].qtd += 1;
      }
    }
  }

  void removeQtd(int id) {
    for (int i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i].id == id) {
        if (_cartItems[i].qtd > 1) {
          _cartItems[i].qtd -= 1;
          return;
        }
        if (_cartItems[i].qtd == 1) {
          _cartItems.remove(_cartItems[i]);
        }
      }
    }
  }

  void addToCart(ProductModel product) {
    for (int i = 0; i < _cartItems.length; i++) {
      if (product.id == _cartItems[i].id) {
        if (_cartItems[i].qtd > 1) {
          _cartItems[i].qtd += product.qtd;
          return;
        }
        addQtd(_cartItems[i].id);
        return;
      }
    }
    _cartItems.add(product);
  }

  void removeFromCart(int id) {
    _cartItems.removeAt(id);
  }

  void clearCart() {
    _cartItems.clear();
  }
}
