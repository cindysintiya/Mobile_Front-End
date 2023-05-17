import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baloonblooms/providers/wishlist_provider.dart';
import 'package:baloonblooms/components/product_card.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({super.key, required this.title, required this.product});
  final String title;
  final List product;

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {

  @override
  Widget build(BuildContext context) {
    final provWishlist = context.watch<WishlistProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ProductCard(product: widget.product, wishlist: provWishlist),
      ),
    );
  }
}