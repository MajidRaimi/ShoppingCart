import 'package:flutter/material.dart';
import 'package:lab7/Store/MyStoreClass.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Text(store.activeProduct.name)),
          Expanded(
            child: Container(
              child: Image.network(store.activeProduct.photo,)
            ),
          ),
          Expanded(child: Text(store.activeProduct.price.toString())),
        ],
      ),
    );
  }
}
