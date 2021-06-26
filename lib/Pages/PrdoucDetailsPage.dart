import 'package:flutter/material.dart';
import 'package:lab7/Store/MyStoreClass.dart';
import 'package:lab7/const.dart';
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
        backgroundColor: kBackgroundColor,
        title: Text("Details" , style: TextStyle(color: kMainColor),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close , color: kMainColor,),
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
                  child: Hero(
                      tag: "tagImage${store.activeProduct.id}",

                      child: Image(
                        image: NetworkImage(store.activeProduct.photo),
                      ))),
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
                      backgroundColor: kMainColor,
                      onPressed: () {
                        setState(() {
                          if (store.activeProduct.qty > 0) {
                            store.activeProduct.qty -= 1;
                          }
                        });
                        store.removeItemFromBasket(store.activeProduct);
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
                    backgroundColor: kMainColor,
                    onPressed: () {
                      setState(() {
                        store.activeProduct.qty += 1;
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            flex: 2,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    store.addElementToBasket(store.activeProduct);
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
