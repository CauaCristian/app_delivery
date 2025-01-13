import 'package:app_delivery/app/Theme/appTheme.dart';
import 'package:flutter/material.dart';
import '../views/mainView.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery Verde',
      theme: AppTheme.lightTheme,
      home: const Mainview(),
    );
  }
}
