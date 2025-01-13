import 'package:app_delivery/components/categoryComponent.dart';
import 'package:app_delivery/components/productComponent.dart';
import 'package:app_delivery/models/productModel.dart';
import 'package:app_delivery/providers/cartProvider.dart';
import 'package:app_delivery/providers/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';

class DetailsProductView extends StatelessWidget {
  final int index;
  const DetailsProductView({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<ProductProvider>(
            builder: (context, productProvider, body) {
          final product = productProvider.listProduct[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        offset: const Offset(4, 4),
                        blurRadius: 0.3,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      product.urlImage,
                      width: 400,
                    ),
                  ),
                ),
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                RatingStars(
                  value: 5,
                  onValueChanged: (v) {
                    //
                  },
                  starBuilder: (index, color) => Icon(
                    Icons.star,
                    color: color,
                  ),
                  starSize: 30,
                  valueLabelColor: Theme.of(context).colorScheme.onPrimary,
                  valueLabelTextStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiary,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0,
                  ),
                  maxValue: 5,
                  starSpacing: 0,
                  maxValueVisibility: true,
                  valueLabelVisibility: true,
                  animationDuration: const Duration(milliseconds: 1000),
                  valueLabelPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  valueLabelMargin: const EdgeInsets.only(right: 5),
                  starOffColor: const Color(0xffe7e8ea),
                  starColor: Theme.of(context).colorScheme.surface,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "R\$ ${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.surface),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            productProvider.removeQtd(product.id);
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text("${product.qtd}"),
                        IconButton(
                          onPressed: () {
                            productProvider.addQtd(product.id);
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Descrição",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Adicionais",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryComponent(text: "Bacon"),
                      CategoryComponent(text: "Sanduiche"),
                      CategoryComponent(text: "Queijo"),
                      CategoryComponent(text: "Molho"),
                      CategoryComponent(text: "Ovo"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      context.read<CartProvider>().addProduct(ProductModel(
                          id: product.id,
                          urlImage: product.urlImage,
                          title: product.title,
                          description: product.description,
                          price: product.price,
                          qtd: product.qtd,
                          type: product.type));
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              icon: const Icon(
                                Icons.verified,
                                color: Colors.green,
                                size: 50,
                              ),
                              title: const Text(
                                'Adicionado com sucesso!',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w900),
                              ),
                              content: Text("${product.qtd}x ${product.title}"),
                            );
                          });
                      await Future.delayed(const Duration(milliseconds: 1300),
                          () {
                        Navigator.of(context).pop();
                      });
                      productProvider.resetQtd(product.id);
                      Navigator.of(context).pop();
                    },
                    child: const Center(
                      child: Text("Adicionar ao Carrinho"),
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
