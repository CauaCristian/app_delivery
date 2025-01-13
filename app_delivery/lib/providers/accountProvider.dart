import 'package:app_delivery/models/accountModel.dart';
import 'package:app_delivery/services/accountService.dart';
import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  AccountService _accountService;
  AccountProvider() : _accountService = AccountService();

  AccountModel get currentAccount => _accountService.getCurrentAccount();

  void addAddress(String address) {
    _accountService.addAddress(address);
    notifyListeners();
  }

  void updateAddress(int index, String address) {
    _accountService.updateAddress(index, address);
    notifyListeners();
  }

  void addCard(String card) {
    _accountService.addCard(card);
    notifyListeners();
  }

  void updateCard(int index, String card) {
    _accountService.updateCard(index, card);
    notifyListeners();
  }
}
