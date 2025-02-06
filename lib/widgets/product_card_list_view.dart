import 'package:flutter/material.dart';
import 'package:recommendation_app/views/product_details.dart';
import 'package:recommendation_app/widgets/product_card.dart';

class ProductCardListView extends StatelessWidget {
  final List<Map<String, dynamic>> productList;
  const ProductCardListView({
    super.key,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetailScreen(product: productList[index]);
              }));
            },
            child: ProductCard(
              image: productList[index]['Image URL'] ?? '',
              productName: productList[index]['Product Name'] ?? '',
              numberOfReviews: productList[index]['Number of Reviews'] ?? '100',
             
               price: (productList[index]['Price'] is int)
                  ? (productList[index]['Price'] as int).toDouble()
                  : (productList[index]['Price'] ?? 10000),
              rating: productList[index]['Rating'] ?? '4',
            ),
          );
        },
      ),
    );
  }
}
