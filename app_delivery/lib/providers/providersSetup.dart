import 'package:app_delivery/app/myApp.dart';
import 'package:app_delivery/providers/accountProvider.dart';
import 'package:app_delivery/providers/bodyProvider.dart';
import 'package:app_delivery/providers/cartProvider.dart';
import 'package:app_delivery/providers/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvidersSetup extends StatelessWidget {
  const ProvidersSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BodyProvider(),
        ),
      ],
      child: MyApp(),
    );
  }
}
