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
      ),
      Product(
          name: "Fries",
          id: 3,
          pId: 3,
          photo:
              "https://img.taste.com.au/ol2Jq8ZQ/taste/2016/11/rachel-87711-2.jpeg",
          qty: 0,
          price: 9.99),
      Product(
          name: "Steak",
          id: 4,
          pId: 4,
          photo:
              "https://www.thespruceeats.com/thmb/hl4lkmdLO7tj1eDCsGbakfk97Co=/3088x2055/filters:fill(auto,1)/marinated-top-round-steak-3060302-hero-02-ed071d5d7e584bea82857112aa734a94.jpg",
          qty: 0,
          price: 99.9),
      Product(
        name: "Wings",
        id: 5,
        pId: 5,
        photo:
            "https://hips.hearstapps.com/hmg-prod/images/classic-buffalo-wings-horizontal-279-1547506077.jpg",
        qty: 0,
        price: 16.99,
      ),
      Product(
          name: "Arekah",
          id: 6,
          pId: 6,
          photo: "https://kitchen.sayidaty.net/uploads/node/4_(10).jpg",
          qty: 0,
          price: 9.99),
    ];

    _drinks = [
      Product(
        name: "Drink",
        id: 1,
        pId: 1,
        photo:
            "https://www.acouplecooks.com/wp-content/uploads/2021/02/Painkiller-Cocktail-008.jpg",
        qty: 0,
        price: 9.99,
      ),
      Product(
        name: "Citrus",
        id: 2,
        pId: 2,
        photo:
            "https://www.alnokhbahmarkets.com/wp-content/uploads/2020/05/8910115.png",
        qty: 0,
        price: 2.5,
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
    }
  }
}
