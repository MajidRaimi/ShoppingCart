import 'package:flutter/material.dart';
import 'package:lab7/Store/MyStoreClass.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Details"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(child: Text(store.activeProduct.name)),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    store.activeProduct.photo,
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              store.activeProduct.price.toString(),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                    scale: 0.8,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if(store.activeProduct.qty > 0){
                            store.activeProduct.qty -= 1 ;
                          }
                        });
                      },
                      child: Icon(Icons.remove),
                    )),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    child: Text(
                      "${store.activeProduct.qty}",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        store.activeProduct.qty += 1 ;
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            flex: 2,
          )
        ],
      ),
    );
  }
}
