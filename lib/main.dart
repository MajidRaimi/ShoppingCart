import 'package:flutter/material.dart';
import 'package:lab7/Pages/ProducListPage.dart';
import 'package:provider/provider.dart';

import 'Store/MyStoreClass.dart';

void main() {
  return runApp(

    // Wrap The MaterialApp As a Child With ChangeNotifierProvider
    ChangeNotifierProvider(
      // Register The Data Store
      // The Data Store Class Is "MyStore"
      create: (context) => MyStore() ,
      child: MaterialApp(
        home: ProductsPage(),
      ),
    ),
  );
}
