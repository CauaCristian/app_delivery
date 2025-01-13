import 'package:app_delivery/components/categoryComponent.dart';
import 'package:app_delivery/components/productComponent.dart';
import 'package:app_delivery/providers/bodyProvider.dart';
import 'package:app_delivery/providers/productProvider.dart';
import 'package:app_delivery/views/cartView.dart';
import 'package:app_delivery/views/homeView.dart';
import 'package:app_delivery/views/menuView.dart';
import 'package:app_delivery/views/paymentView.dart';
import 'package:app_delivery/views/perfilView.dart';
import 'package:app_delivery/views/searchView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mainview extends StatelessWidget {
  const Mainview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<BodyProvider>().changeBody(const MenuView());
            },
            icon: const Icon(
              Icons.menu,
              size: 30,
            )),
        title: const Center(
          child: Text("Delivery Verde"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<BodyProvider>().changeBody(const PerfilView());
            },
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ],
      ),
      body: Consumer<BodyProvider>(builder: (context, bodyProvider, body) {
        return bodyProvider.body;
      }),
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(0, 0),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  context.read<BodyProvider>().changeBody(const HomeView());
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  context.read<BodyProvider>().changeBody(const SearchView());
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  context.read<BodyProvider>().changeBody(const CartView());
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  context.read<BodyProvider>().changeBody(const PaymentView());
                },
                icon: const Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
