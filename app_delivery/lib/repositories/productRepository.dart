import 'package:app_delivery/models/productModel.dart';

class ProductRepository {
  final List<ProductModel> _products = [
    ProductModel(
        id: 1,
        urlImage: "assets/combo2.png",
        title: "Combo Clássico",
        description: "BATATA, XSALADA, COCA LATA 350ML.",
        price: 29.99,
        type: "SANDUICHE"),
    ProductModel(
        id: 2,
        urlImage: "assets/sanduiche1.png",
        title: "XSALADA",
        description: "SALADA, HAMBÚRGUER, CHEDDAR.",
        price: 14.99,
        type: "SANDUICHE"),
    ProductModel(
        id: 3,
        urlImage: "assets/sanduiche3.png",
        title: "XDUPLO",
        description: "SALADA, 2 HAMBÚRGUERES, 2 CHEDDAR",
        price: 19.99,
        type: "SANDUICHE"),
  ];

  int getQtd(int id) {
    for (int i = 0; i < _products.length; i++) {
      if (_products[i].id == id) {
        return _products[i].qtd;
      }
    }
    return 1;
  }

  void addQtd(int id) {
    for (int i = 0; i < _products.length; i++) {
      if (_products[i].id == id) {
        _products[i].qtd += 1;
      }
    }
  }

  void removeQtd(int id) {
    for (int i = 0; i < _products.length; i++) {
      if (_products[i].id == id) {
        if (_products[i].qtd > 1) {
          _products[i].qtd -= 1;
        }
      }
    }
  }

  void resetQtd(int id) {
    for (int i = 0; i < _products.length; i++) {
      if (_products[i].id == id) {
        _products[i].qtd = 1;
      }
    }
  }

  List<ProductModel> getProducts() {
    return _products;
  }

  void addProduct(ProductModel product) {
    _products.add(product);
  }

  void removeProduct(int id) {
    _products.removeAt(id);
  }
}
