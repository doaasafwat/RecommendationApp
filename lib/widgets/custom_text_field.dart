import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recommendation_app/views/search_screen.dart';

class CustomTextField extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
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
            QuerySnapshot snapshot =
                await firestore.collection('products').get();

            List<Map<String, dynamic>> products = snapshot.docs
                .map((doc) => doc.data() as Map<String, dynamic>)
                .toList();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(
                  searchQuery: value,
                  products: products,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
