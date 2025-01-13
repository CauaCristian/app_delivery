class ProductModel {
  int id;
  String urlImage;
  String title;
  String description;
  double price;
  int qtd;
  String type;
  bool isOffer;
  ProductModel({
    required this.id,
    required this.urlImage,
    required this.title,
    required this.description,
    required this.price,
    required this.type,
    this.qtd = 1,
    this.isOffer = false,
  });
}
