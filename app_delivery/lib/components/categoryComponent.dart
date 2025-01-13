import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final String text;

  CategoryComponent({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
