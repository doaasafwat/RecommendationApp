import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:recommendation_app/widgets/banner_widget.dart';
import 'package:recommendation_app/widgets/custom_text_field.dart';
import 'package:recommendation_app/widgets/indicator_dot.dart';
import 'package:recommendation_app/widgets/offer_product.dart';
import 'package:recommendation_app/widgets/product_card_list_view.dart';
import 'package:recommendation_app/widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Buy',
                style: TextStyle(
                  color: Color(0xffFF5521),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Zaar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.8),
                  const Color(0xffFFA160).withOpacity(0.7),
                ],
                begin: Alignment.center,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(),
                Center(child: BannerWidget()),
                const SizedBox(height: 10),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IndicatorDot(isActive: false),
                      const SizedBox(width: 5),
                      IndicatorDot(isActive: false),
                      const SizedBox(width: 5),
                      IndicatorDot(isActive: true),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const SectionTitle(title: 'Winter Offers'),
                StreamBuilder<QuerySnapshot>(
                  stream: firestore.collection('products').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No products'));
                    }

                    var products = snapshot.data!.docs
                        .map((doc) => doc.data() as Map<String, dynamic>)
                        .toList();

                    return OfferProduct(products: products);
                  },
                ),
                const SectionTitle(title: 'Weekly Offers'),
                StreamBuilder<QuerySnapshot>(
                  stream: firestore.collection('products').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No products'));
                    }

                    var products = snapshot.data!.docs
                        .map((doc) => doc.data() as Map<String, dynamic>)
                        .toList();

                    return OfferProduct(products: products);
                  },
                ),
                const SectionTitle(title: 'Explore'),
                StreamBuilder<QuerySnapshot>(
                  stream: firestore.collection('products').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No products'));
                    }

                    var products = snapshot.data!.docs
                        .map((doc) => doc.data() as Map<String, dynamic>)
                        .toList();

                    return ProductCardListView(
                      productList: products,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xffFF7C21),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.fileText),
            label: 'Invoice',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.heart),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.shoppingCart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
