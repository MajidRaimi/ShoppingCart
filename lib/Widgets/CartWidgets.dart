import 'package:flutter/material.dart';
import 'package:lab7/Model/Products.dart';
import 'package:lab7/const.dart';

class ShowInCart extends StatelessWidget {
  final Product product;

  ShowInCart({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        width: double.infinity,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(product.photo),
                    radius: double.infinity,
                  ),
                )
              ),
              flex: 3,
            ),
            Expanded(
              child: Center(child: Text(product.name , style : TextStyle(color: kMainColor , fontFamily: kMainFont , fontSize: 20),)),
              flex: 7,
            ),
            Expanded(
              child: Center(
                child: Text(
                  product.qty.toString(),
                  style : TextStyle(color: kMainColor , fontFamily: kMainFont , fontSize: 20),
                ),
              ),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
