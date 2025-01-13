import 'package:app_delivery/models/productModel.dart';
import 'package:app_delivery/services/productService.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _productService;
  ProductProvider() : _productService = ProductService();

  List<ProductModel> get listProduct => _productService.getProducts();

  void addQtd(int id) {
    _productService.addQtd(id);
    notifyListeners();
  }

  void removeQtd(int id) {
    _productService.removeQtd(id);
    notifyListeners();
  }

  void resetQtd(int id) {
    _productService.resetQtd(id);
    notifyListeners();
  }

  void addProduct(ProductModel product) {
    _productService.addProduct(product);
    notifyListeners();
  }

  void removeProduct(int id) {
    _productService.removeProduct(id);
    notifyListeners();
  }
}
