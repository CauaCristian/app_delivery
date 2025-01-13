import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "404 Not Found",
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 30,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
