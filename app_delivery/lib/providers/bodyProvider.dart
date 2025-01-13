import 'package:app_delivery/views/homeView.dart';
import 'package:flutter/material.dart';

class BodyProvider extends ChangeNotifier {
  Widget _body = const HomeView();
  BodyProvider();
  Widget get body => _body;
  void changeBody(Widget widget) {
    _body = widget;
    notifyListeners();
  }
}
