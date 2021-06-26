import 'package:flutter/material.dart';
import 'package:lab7/Model/Products.dart';


class ShowInCart extends StatelessWidget {

  final Product product ;

  ShowInCart({required this.product}) ;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
        ),
        width: double.infinity,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(product.photo),
              ),
            ) , flex: 3,) ,
            Expanded(child: Center(child: Text(product.name)) , flex: 7,),
            Expanded(child: Center(child: Text(product.qty.toString())) , flex: 3,)
          ],
        ),
      ),
    );
  }
}
