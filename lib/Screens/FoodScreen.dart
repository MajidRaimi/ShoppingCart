import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:lab7/Pages/BasketPage.dart';
import 'package:lab7/Pages/PrdoucDetailsPage.dart';
import 'package:lab7/Store/MyStoreClass.dart';
import 'package:provider/provider.dart';

import '../const.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);

    return GridView.builder(
        itemCount: store.products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          return Expanded(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        store.setActiveProduct(store.products[i]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Hero(
                            tag: "tagImage${store.products[i].id}",
                            child: Image(
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                              image: NetworkImage(store.products[i].photo),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xACFFFFFF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${store.products[i].name}",
                            style: TextStyle(
                              color: kMainColor,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        width: double.infinity,
                      ),
                      alignment: Alignment.bottomCenter,
                    )
                  ],
                )),
          );
        });
  }
}
