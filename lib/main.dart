import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'models/product.dart';

void main() {
  runApp(const MiniCatalogApp());
}

class MiniCatalogApp extends StatefulWidget {
  const MiniCatalogApp({super.key});

  @override
  State<MiniCatalogApp> createState() => _MiniCatalogAppState();
}

class _MiniCatalogAppState extends State<MiniCatalogApp> {
  final List<Product> _cartItems = [];

  void _addToCart(Product product) {
    setState(() {
      _cartItems.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Catalog App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarTextStyle: TextStyle(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: HomeScreen(
        cartItems: _cartItems,
        onAddToCart: _addToCart,
      ),
    );
  }
}
