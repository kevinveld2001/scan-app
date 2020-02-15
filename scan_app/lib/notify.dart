
import 'package:flutter/foundation.dart';


class Notify with ChangeNotifier {

 double _totalPrice = 0;

 void add (double price) {
  _totalPrice += price;
  print("price: ${_totalPrice.toStringAsFixed(2)}");
  notifyListeners();
 }

  void remove (double price){
  _totalPrice -= price;
  print("price: ${_totalPrice.toStringAsFixed(2)}"); 
  notifyListeners();
  }


  double get totalPrice => _totalPrice;

}