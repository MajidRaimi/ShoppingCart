import 'package:flutter/material.dart';
import 'package:lab7/Pages/BasketPage.dart';
import 'package:lab7/Pages/PrdoucDetailsPage.dart';
import 'package:lab7/Store/MyStoreClass.dart';
import 'package:provider/provider.dart';

import '../const.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // add listener to listen for every notification

    var store = Provider.of<MyStore>(context);

    print(store.products[0].name);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.repeat , color: kMainColor,),
          onPressed: (){
            store.emptyTheBasket() ;
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Text("Products" , style: TextStyle(color: kMainColor),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => BasketPage())) ;
          }, icon: Icon(Icons.shopping_cart_rounded , color: kMainColor,))
        ],
      ),
      body: GridView.builder(
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
                              tag: store.products[i].id,
                              child: Image(
                                image: NetworkImage(store.products[i].photo),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x80000000),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(45),
                              bottomRight: Radius.circular(45),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${store.products[i].name}",
                              style: TextStyle(color: Colors.white),
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
          }),
    );
  }
}
