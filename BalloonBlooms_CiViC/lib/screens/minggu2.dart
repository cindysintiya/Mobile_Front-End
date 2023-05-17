import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baloonblooms/providers/product_provider.dart';
import 'package:baloonblooms/providers/wishlist_provider.dart';
import 'package:baloonblooms/components/product_card.dart';   // M02 - layout

class Product extends StatefulWidget {
  const Product({super.key, required this.title, required this.search});
  final String title;
  final String search;
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  // pemanfaatan layout ada di file product_card.dart

  @override
  Widget build(BuildContext context) {
    final provProduk = context.watch<ProductProvider>();
    final provWishlist = context.watch<WishlistProvider>();
  
    return provProduk.searchVal.isEmpty? ProductCard(product: provProduk.products, wishlist: provWishlist) :
      provProduk.searchProducts.isNotEmpty? ProductCard(product: provProduk.searchProducts, wishlist: provWishlist) :
      const Center(
        child: Text('Produk yang dicari tidak ditemukan'),
      );
  }
}