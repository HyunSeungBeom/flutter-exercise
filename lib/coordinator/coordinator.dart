import 'package:flutter/material.dart';

import 'next_screen.dart';

class Coordinator {
  static Coordinator? _instance;

  factory Coordinator() {
    if (_instance == null) {
      _instance = Coordinator._();
    }
    return _instance!;
  }

  Coordinator._();

  void goToNextScreen(BuildContext context, String data) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NextScreen(data: data),
      ),
    );
  }
}
