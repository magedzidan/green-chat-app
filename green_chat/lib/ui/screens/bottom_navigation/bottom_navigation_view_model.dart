import 'package:flutter/material.dart';
import 'package:green_chat/core/other/base_view_modle.dart';
import 'package:green_chat/ui/screens/bottom_navigation/chat_list/chat_list_screen.dart';

class BottomNavigationViewModel extends BaseViewModle {
  int? _currentIndex;
  int? get currentindex => _currentIndex;

  static final List<Widget> _screens = [
    Text('hello from the second'),
    ChatListScreen(),
    Text('hello from the third')
  ];

  List<Widget> get screens => _screens;

  void setCurrentScreen(int value) {
    if (_currentIndex != value) _currentIndex = value;
    notifyListeners();
  }
}
