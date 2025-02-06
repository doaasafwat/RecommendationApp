import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recommendation_app/Api/api_services.dart';
import 'package:recommendation_app/views/product_details.dart';
import 'package:recommendation_app/views/search_screen.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> fetchProducts(
      String query, BuildContext context) async {
    try {
      List<String> productIds =
          await ApiService.fetchProductIds(query, context);
      List<Map<String, dynamic>> products = [];
      for (String id in productIds) {
        DocumentSnapshot doc =
            await firestore.collection('products').doc(id).get();
        if (doc.exists) {
          products.add(doc.data() as Map<String, dynamic>);
        }
      }
      return products;
    } catch (e) {
      _showErrorMessage(context, 'updating or deleting is not allowed.');
      searchController.clear();
      rethrow;
    }
  }

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 350,
        height: 40,
        child: TextField(
          controller: searchController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(Icons.search),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onSubmitted: (value) async {
            if (value.isEmpty) return;

            List<Map<String, dynamic>> products =
                await fetchProducts(value, context);

            searchController.clear();

            if (products.isEmpty) {
              _showErrorMessage(context, 'No products found.');
            } else if (products.length == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    product: products.first,
                  ),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    searchQuery: value,
                    products: products,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
