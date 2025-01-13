import 'package:app_delivery/providers/accountProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Endereços",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Adicionar"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Consumer<AccountProvider>(
                builder: (context, account, children) {
              final currentAccount = account.currentAccount;
              return SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: currentAccount.address.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 150,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            spreadRadius: 10,
                          )
                        ]),
                        child: Text(
                          currentAccount.address[index],
                          style: TextStyle(color: Colors.amber),
                        ),
                      );
                    }),
              );
            }),
          )
        ],
      ),
    );
  }
}
