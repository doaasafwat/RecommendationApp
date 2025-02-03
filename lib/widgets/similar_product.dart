import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recommendation_app/views/product_details.dart';

class SimilarProducts extends StatelessWidget {
  final List<String> images = [
    'https://m.media-amazon.com/images/I/51Cida8RecL.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://m.media-amazon.com/images/I/51Cida8RecL.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://m.media-amazon.com/images/I/51Cida8RecL.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://m.media-amazon.com/images/I/51Cida8RecL.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://m.media-amazon.com/images/I/51Cida8RecL.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://m.media-amazon.com/images/I/51Cida8RecL.__AC_SX300_SY300_QL70_ML2_.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetailScreen(product: {},);
        }));
      },
      child: CarouselSlider(
        options: CarouselOptions(
          height: 180,
          enableInfiniteScroll: false,
          viewportFraction: 0.4,
        ),
        items: images.map((imgUrl) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(imgUrl, width: 148, height: 95),
                ),
                const SizedBox(height: 5),
                const Text(
                  '125.30 US',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Free shipping',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff109F03),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
