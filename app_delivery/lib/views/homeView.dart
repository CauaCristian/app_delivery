import 'package:app_delivery/components/categoryComponent.dart';
import 'package:app_delivery/components/productComponent.dart';
import 'package:app_delivery/providers/productProvider.dart';
import 'package:app_delivery/views/detailsProductView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Os melhores hambúrgueres estão aqui!",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 27,
                      color: Theme.of(context).colorScheme.onTertiary),
                ),
              ),
              Text(
                "Av Vereador João de Luca, SP",
                style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.onTertiary),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(20),
          height: 170,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 0),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Melhores Combos em Promoções",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  Text(
                    "Delivery verde",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.secondary)),
                    child: SizedBox(
                      height: 45,
                      width: 150,
                      child: Center(
                        child: Text(
                          "Veja Mais",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset("assets/oferta.png")
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Categorias",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onTertiary),
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryComponent(text: "Todos"),
                    CategoryComponent(text: "Bebidas"),
                    CategoryComponent(text: "Sanduiches"),
                    CategoryComponent(text: "Combos"),
                    CategoryComponent(text: "Baguetes"),
                    CategoryComponent(text: "Batatas"),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                margin: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Populares da Semana",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onTertiary),
                ),
              ),
              SizedBox(
                height: 250,
                child: Consumer<ProductProvider>(
                    builder: (context, productProvider, child) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productProvider.listProduct.length,
                      itemBuilder: (context, index) {
                        final product = productProvider.listProduct[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailsProductView(
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: ProductComponent(
                              urlImage: product.urlImage,
                              title: product.title,
                              description: product.description,
                              price: "R\$ ${product.price.toString()}"),
                        );
                      });
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
