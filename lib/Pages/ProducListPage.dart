import 'package:flutter/material.dart';
import 'package:lab7/Pages/BasketPage.dart';
import 'package:lab7/Pages/PrdoucDetailsPage.dart';
import 'package:lab7/Store/MyStoreClass.dart';
import 'package:provider/provider.dart';
import 'package:lab7/Screens/FoodScreen.dart';
import 'package:lab7/Screens/DrinksScreen.dart';


import '../const.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // add listener to listen for every notification

    var store = Provider.of<MyStore>(context);

    return DefaultTabController(
      child: Scaffold(
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
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.fastfood , color: kMainColor,),) ,
              Tab(icon: Icon(Icons.local_drink_sharp , color: kMainColor,),)
            ],
            indicatorColor: kMainColor,
          ),

        ),



        body: TabBarView(
          children: [
            FoodScreen() ,
            DrinksScreen() ,
          ],
        ) ,
      ),
      length: 2,
      initialIndex: 0,
    ) ;
  }
}
