import 'package:flutter/material.dart';
import 'package:recommendation_app/widgets/search_item_list_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen(
      {super.key, required this.searchQuery, required this.products});

  final String searchQuery;
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredProducts = products.where((product) {
      String productName = product['Product Name'] ?? '';
      return productName.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Results"),
        centerTitle: true,
      ),
      body: SearchItemListView(filteredProducts: filteredProducts),
    );
  }
}
