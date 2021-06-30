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
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Hero(
                    tag: "tagImage${store.activeProduct.id}",
                    child: Image(
                      width: double.infinity,
                      image: AssetImage(store.activeProduct.photo),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 35),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          flex: 9,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Details ",
                                            style: TextStyle(
                                                color: kMainColor,
                                                fontFamily: kMainFont,
                                                fontSize: 20),
                                          ),
                                          Icon(
                                            Icons.info,
                                            color: kMainColor,
                                            size: 30,
                                          ),
                                          Text(
                                            " : ",
                                            style: TextStyle(
                                                color: kMainColor,
                                                fontFamily: kMainFont,
                                                fontSize: 25),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Text(
                                            "A",
                                            style: TextStyle(
                                                color: kMainColor,
                                                fontFamily: kMainFont,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            "B",
                                            style: TextStyle(
                                                color: kMainColor,
                                                fontFamily: kMainFont,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            "C",
                                            style: TextStyle(
                                                color: kMainColor,
                                                fontFamily: kMainFont,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Calories ",
                                            style: TextStyle(
                                                color: kMainColor,
                                                fontFamily: kMainFont,
                                                fontSize: 20),
                                          ),
                                          Icon(
                                            Icons.local_fire_department,
                                            color: kMainColor,
                                            size: 30,
                                          ),
                                          Text(
                                            " : ",
                                            style: TextStyle(
                                                color: kMainColor,
                                                fontFamily: kMainFont,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 18.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "340",
                                              style: TextStyle(
                                                color: kMainColor,
                                                fontFamily: kMainFont,
                                                fontSize: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Price : ",
                                style: TextStyle(
                                    color: kMainColor,
                                    fontFamily: kMainFont,
                                    fontSize: 25),
                              ),
                              Text(
                                store.activeProduct.price.toString(),
                                style: TextStyle(
                                    color: kMainColor,
                                    fontFamily: kMainFont,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 1.0),
                      child: Text(
                        "${store.activeProduct.qty}",
                        style: TextStyle(fontSize: 25 , color: kMainColor),
                      ),
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
            flex: 1,
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
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: "Pacifico"),
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
