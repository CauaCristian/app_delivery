import 'package:app_delivery/repositories/productRepository.dart';
import 'package:app_delivery/models/productModel.dart';

class ProductService {
  final ProductRepository _productRepository;
  ProductService() : _productRepository = ProductRepository();

  List<ProductModel> getProducts() {
    return _productRepository.getProducts();
  }

  int getQtd(int id) {
    return _productRepository.getQtd(id);
  }

  void addQtd(int id) {
    _productRepository.addQtd(id);
  }

  void removeQtd(int id) {
    _productRepository.removeQtd(id);
  }

  void resetQtd(int id) {
    _productRepository.resetQtd(id);
  }

  void addProduct(ProductModel product) {
    _productRepository.addProduct(product);
  }

  void removeProduct(int id) {
    _productRepository.removeProduct(id);
  }
}
