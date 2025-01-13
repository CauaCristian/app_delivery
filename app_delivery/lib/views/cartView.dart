import 'package:app_delivery/components/productComponent.dart';
import 'package:app_delivery/models/productModel.dart';
import 'package:app_delivery/providers/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, widget) {
      return cart.items.isNotEmpty
          ? Container(
              color: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 550,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: cart.items.length,
                          itemBuilder: (context, index) {
                            final item = cart.items[index];
                            return Dismissible(
                                key: Key(cart.items[index].id.toString()),
                                secondaryBackground: Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: const Alignment(0.9, 0.0),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                background: Container(),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.endToStart) {
                                    cart.removeProduct(index);
                                    cart.getTotalPrice();
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(15),
                                  height: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.03),
                                          offset: const Offset(4, 4),
                                          blurRadius: 0.4,
                                          spreadRadius: 1,
                                        ),
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 70,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        backgroundImage:
                                            AssetImage(item.urlImage),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.title,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            item.description,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Text(
                                            "R\$${item.price.toString()}",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              cart.removeQtd(item.id);
                                            },
                                            icon: const Icon(Icons.remove),
                                          ),
                                          Text(item.qtd.toString()),
                                          IconButton(
                                            onPressed: () {
                                              cart.addQtd(item.id);
                                            },
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ));
                          })),
                  Container(
                    height: 240,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(1),
                          offset: const Offset(0, 7),
                          blurRadius: 12,
                          spreadRadius: 0.05,
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Theme.of(context).colorScheme.onError,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Subtotal",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Consumer<CartProvider>(
                                    builder: (context, cart, child) {
                                  return Text(
                                    "R\$ ${cart.totalPrice.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface),
                                  );
                                })),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Entrega",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "R\$ 2.00",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color:
                                        Theme.of(context).colorScheme.surface),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Total",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Consumer<CartProvider>(
                                      builder: (context, cart, child) {
                                    return Text(
                                      "R\$ ${(cart.totalPrice + 2).toStringAsFixed(2)}",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const SizedBox(
                                  width: 160,
                                  height: 45,
                                  child: Center(
                                    child: Text("Confirmar"),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/zzz.png",
                    width: 300,
                  ),
                  Text(
                    "O Carrinho está vazio!",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            );
    });
  }
}
