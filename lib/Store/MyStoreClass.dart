import 'package:flutter/cupertino.dart';
import 'package:lab7/Model/Products.dart';

class MyStore extends ChangeNotifier {
  // The Public Class

  List<Product> _products = [];
  List<Product> _drinks = [];
  List<Product> _basket = [];

  late Product _activeProduct;

  MyStore() {


    _products = [
      Product(
        name: "Burger",
        id: 1,
        pId: 1,
        photo: "images/food/burger.jpg",
        qty: 0,
        price: 29.99,
      ),
      Product(
        name: "Pizza",
        id: 2,
        pId: 2,
        photo:
            "images/food/pizza.jpg",
        qty: 0,
        price: 39.99,
      ),
      Product(
          name: "Fries",
          id: 3,
          pId: 3,
          photo:
              "images/food/fries.jpeg",
          qty: 0,
          price: 9.99),
      Product(
          name: "Steak",
          id: 4,
          pId: 4,
          photo:
              "images/food/steak.jpg",
          qty: 0,
          price: 99.9),
      Product(
        name: "Wings",
        id: 5,
        pId: 5,
        photo:
            "images/food/wings.jpg",
        qty: 0,
        price: 16.99,
      ),

    ];

    _drinks = [
      Product(
        name: "Drink",
        id: 1,
        pId: 1,
        photo:
            "images/drinks/drink.webp",
        qty: 0,
        price: 9.99,
      ),
      Product(
        name: "Water",
        id: 2,
        pId: 2,
        photo:
            "images/drinks/water.jpg",
        qty: 0,
        price: 1.5,
      ),
    ];

    notifyListeners();
  }

  // in order to ui to access you need to get it

  List<Product> get products {
    return _products;
  }

  List<Product> get drinks {
    return _drinks;
  }

  List<Product> get basket {
    return _basket;
  }

  Product get activeProduct => _activeProduct;

  setActiveProduct(Product input) {
    _activeProduct = input;
  }

  // Add or remove objects from basket
  void addElementToBasket(Product input) {
    Product nothing = Product(
        name: "Noting", id: 0, pId: 0, photo: "Nothing", qty: 0, price: 0);

    Product found =
        _basket.firstWhere((a) => a.id == input.id, orElse: () => nothing);

    if (found != nothing) {
      // found.qty += 1 ;
    } else {
      _basket.add(input);
    }

    notifyListeners();
  }

  void removeItemFromBasket(Product input) {
    Product nothing = Product(
        name: "Noting", id: 0, pId: 0, photo: "Nothing", qty: 0, price: 0);
    Product found =
        _basket.firstWhere((a) => a.id == input.id, orElse: () => nothing);

    if (found != nothing && found.qty == 1) {
      _basket.remove(input);
    }

    notifyListeners();
  }

  getBasketTotalQty() {
    int total = 0;
    for (int i = 0; i < basket.length; i++) {
      total += basket[i].qty;
    }
    return total;
  }

  getTotalPrice() {
    double total = 0;
    for (int i = 0; i < basket.length; i++) {
      total += basket[i].price * basket[i].qty;
    }

    String sTotal = total.toStringAsFixed(2);

    return sTotal;
  }

  emptyTheBasket() {
    _basket = [];
    for (int i = 0; i < _products.length; i++) {
      products[i].qty = 0;
      drinks[i].qty = 0 ;
    }
  }
}
