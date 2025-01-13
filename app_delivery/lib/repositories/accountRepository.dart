import 'package:app_delivery/models/accountModel.dart';

class AccountRepository {
  late AccountModel _currentAccount;
  AccountRepository();

  AccountModel get currentAccount => _currentAccount = AccountModel(
      id: 1,
      name: "caua",
      email: "cauainocencio14@hotmail.com",
      cellPhone: "+55-64-99305-6804",
      address: ["avenida couto de magalhães 1193"],
      cards: ["5555666677778888"]);
  void addAddress(String address) {
    _currentAccount.address.add(address);
  }

  void updateAddress(int index, String address) {
    _currentAccount.address.removeAt(index);
    _currentAccount.address.insert(index, address);
  }

  void addCard(String card) {
    _currentAccount.cards!.add(card);
  }

  void updateCard(int index, card) {
    _currentAccount.cards!.removeAt(index);
    _currentAccount.cards!.insert(index, card);
  }
}
