import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String productName;
  final double price;
  final String rating;
  String numberOfReviews;

  ProductCard(
      {super.key,
      required this.image,
      required this.price,
      required this.rating,
      required this.numberOfReviews,
      required this.productName});

  @override
  Widget build(BuildContext context) {
    if (numberOfReviews == 'Only 1 left in stock - order soon.' ||
        numberOfReviews == 'No featured offers available') {
      numberOfReviews = '100';
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              image,
              height: 130,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName.split(',')[0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '$price EGP',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      numberOfReviews.split(',')[0],
                      style: const TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      rating.split('o')[0],
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 14,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'free shipping',
                  style: TextStyle(
                    color: Color(0xff109F03),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
