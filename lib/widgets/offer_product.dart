import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:recommendation_app/views/product_details.dart';

class OfferProduct extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  OfferProduct({super.key, required this.products});

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
                  child: Image.network(product['Image URL'],
                      width: 148, height: 95),
                ),
                const SizedBox(height: 5),
                Text(
                  '${product['Price'] ?? 10000} US',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                 
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'save 20%',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'still 24',
                      style: TextStyle(
                        color: Color(0xffFF2E21),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
