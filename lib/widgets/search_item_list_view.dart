import 'package:flutter/material.dart';
import 'package:recommendation_app/views/product_details.dart';
import 'package:recommendation_app/widgets/product_card.dart';

class SearchItemListView extends StatelessWidget {
  const SearchItemListView({
    super.key,
    required this.filteredProducts,
  });

  final List<Map<String, dynamic>> filteredProducts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetailScreen(
                      product: filteredProducts[index],
                    );
                  },
                ),
              );
            },
            child: ProductCard(
              image: filteredProducts[index]['Image URL'] ?? '',
              productName: filteredProducts[index]['Product Name'] ?? '',
              numberOfReviews:
                  filteredProducts[index]['Number of Reviews'] ?? '100',
              price: (filteredProducts[index]['Price'] is int)
                  ? (filteredProducts[index]['Price'] as int).toDouble()
                  : (filteredProducts[index]['Price'] ?? 10000),
              rating: filteredProducts[index]['Rating'] ?? '4',
            ),
          );
        },
      ),
    );
  }
}
