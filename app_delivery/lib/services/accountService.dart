import 'package:app_delivery/models/accountModel.dart';
import 'package:app_delivery/repositories/accountRepository.dart';

class AccountService {
  AccountRepository _accountRepository;
  AccountService() : _accountRepository = AccountRepository();

  AccountModel getCurrentAccount() {
    return _accountRepository.currentAccount;
  }

  void addAddress(String address) {
    _accountRepository.addAddress(address);
  }

  void updateAddress(int index, String address) {
    _accountRepository.updateAddress(index, address);
  }

  void addCard(String card) {
    _accountRepository.addCard(card);
  }

  void updateCard(int index, card) {
    _accountRepository.updateCard(index, card);
  }
}
