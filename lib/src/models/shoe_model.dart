import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _assetImage = 'assets/images/blue.png';
  String _size = '41';

  String get assetImage => this._assetImage;
  set assetImage(String value) {
    this._assetImage = value;
    notifyListeners();
  }

  String get size => this._size;
  set size(String value) {
    this._size = value;
    notifyListeners();
  }
}
