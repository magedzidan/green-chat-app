import 'package:flutter/material.dart';
import 'package:green_chat/core/enums/enums.dart';

class BaseViewModle extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
