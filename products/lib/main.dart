import 'package:flutter/material.dart';
// pages 
import 'package:products/pages/product_add.dart';
import 'package:products/pages/product_edit.dart';
import 'package:products/pages/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
          '/' : (context)=> const ProductsList(),
          '/add-product' : (context) => const ProductAdd(),
          '/edit-product' : (context) => const ProductEdit(),
          },
    );
  }
}
