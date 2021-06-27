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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
            flex: 5,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30) ,
                      bottomRight: Radius.circular(30)
                  ),
                  child: Image(
                    width: double.infinity,
                    image: NetworkImage(store.activeProduct.photo),
                    fit: BoxFit.fill,
                  ),
                ) ,
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15 ,
                    top: 20
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context) ;
                    },
                    child: Container(
                      child: Icon(Icons.close , color: Colors.white, size: 20,),
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                )
              ],
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
