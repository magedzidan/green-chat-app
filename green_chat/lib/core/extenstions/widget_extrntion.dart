import 'package:flutter/material.dart';

extension ContextExtenstion on BuildContext {
  showSnackBar(String text) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        content: Text(text),
      ));
}
