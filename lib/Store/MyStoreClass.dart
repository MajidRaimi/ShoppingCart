import 'package:flutter/cupertino.dart';
import 'package:lab7/Model/Products.dart';

class MyStore extends ChangeNotifier {
  // The Public Class

  List<Product> _products = [];

  List<Product> _basket = [];

  late Product _activeProduct;

  MyStore() {
    _products = [
      Product(
        name: "Burger",
        id: 1,
        pId: 1,
        photo:
            "https://www.tasteofhome.com/wp-content/uploads/2020/03/Smash-Burgers_EXPS_TOHcom20_246232_B10_06_10b.jpg?fit=700,1024",
        qty: 0,
        price: 29.99,
      ),
      Product(
        name: "Pizza",
        id: 2,
        pId: 2,
        photo:
            "http://simply-delicious-food.com/wp-content/uploads/2020/06/Grilled-Pizza-Margherita-3.jpg",
        qty: 0,
        price: 39.99,
      ) ,

    ];

    notifyListeners();
  }

  // in order to ui to access you need to get it

  List<Product> get products {
    return _products;
  }

  List<Product> get basket {
    return _basket;
  }

  Product get activeProduct => _activeProduct;


  setActiveProduct(Product input){
    _activeProduct = input ;
  }


}


