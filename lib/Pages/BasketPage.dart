import 'package:flutter/material.dart';
import 'package:lab7/Store/MyStoreClass.dart';
import 'package:lab7/Widgets/CartWidgets.dart';
import 'package:lab7/const.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios , color: kMainColor,),
            onPressed: () {
              Navigator.pop(context) ;
            },
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Text(
                  store.getBasketTotalQty().toString(),
                  style: TextStyle(fontSize: 20 , color: kMainColor),
                ),
              ),
            ),
          ],
          title: Text("Basket" , style: TextStyle(color: kMainColor),),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: store.basket.length,
                itemBuilder: (context, i) {
                  return ShowInCart(product: store.basket[i]);
                },
              ),
              flex: 10,
            ),
            Expanded(
                child: Text(
                    "Total Of ${store.getBasketTotalQty()} Orders For ${store.getTotalPrice().toString()} SAR"))
          ],
        ));
  }
}
