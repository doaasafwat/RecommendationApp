import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recommendation_app/views/product_details.dart';

class SimilarProducts extends StatelessWidget {
 final List<Map<String, dynamic>> products;

  const SimilarProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        enableInfiniteScroll: false,
        viewportFraction: 0.4,
      ),
      items: products.map((product) {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetailScreen(product: product);
              }));
            },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:
                      Image.network(product['Image URL'], width: 148, height: 95),
                ),
                const SizedBox(height: 5),
                 Text(
                    product['Product Name'].split(',')[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                    const SizedBox(height: 4),
                Text(
                  '${product['Price']} EGP',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
