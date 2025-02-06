import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recommendation_app/widgets/similar_product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentImageIndex = 0;
  List<Map<String, String>> specifications = [];

  @override
  void initState() {
    super.initState();

    specifications = [
      {
        'Feature': 'Product Name',
        'Specification': widget.product['Product Name'] ?? '',
      },
      {
        'Feature': 'Brand Name',
        'Specification': widget.product['Brand Name'] ?? '',
      },
      {
        'Feature': 'Model Name',
        'Specification': widget.product['Model Name'] ?? '',
      },
      {
        'Feature': 'RAM',
        'Specification': widget.product['RAM'] ?? '16',
      },
      {
        'Feature': 'Operating System',
        'Specification': widget.product['Operating System'] ?? '',
      },
      {
        'Feature': 'RAM Memory Installed',
        'Specification': widget.product['RAM Memory Installed'] ?? '',
      },
      {
        'Feature': 'CPU Model',
        'Specification': widget.product['CPU Model'] ?? '',
      },
      {
        'Feature': 'CPU Speed',
        'Specification': widget.product['CPU Speed'] ?? '',
      },
      {
        'Feature': 'Memory Storage Capacity',
        'Specification': widget.product['Memory Storage Capacity'] ?? '',
      },
      {
        'Feature': 'Screen Size',
        'Specification': widget.product['Screen Size'] ?? '',
      },
      {
        'Feature': 'Resolution',
        'Specification': widget.product['Resolution'] ?? '',
      },
      {
        'Feature': 'Refresh Rate',
        'Specification': widget.product['Refresh Rate'] ?? '',
      },
    ];
  }

  int selectedShippingIndex = 0;
  int selectedColorIndex = 0;
  int selectedStrogeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 161, 157, 157),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Color.fromARGB(255, 238, 235, 235),
                  size: 14,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    items: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.product['Image URL'] ?? 'images/black.png',
                          width: double.infinity,
                        ),
                      )
                    ],
                    options: CarouselOptions(
                      height: 300,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentImageIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${currentImageIndex + 1}/1',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.product['Product Name']?.split(',')[0] ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '${widget.product['Price'] ?? 10000}US',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '+ 8 US shipping',
                    style: TextStyle(fontSize: 14, color: Color(0xffFF5521)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Color:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  _colorOption('images/black.png', 0),
                  _colorOption('images/blue.png', 1),
                  _colorOption('images/red.png', 2),
                  _colorOption('images/green.png', 3),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Storage:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  _storageOption('128 GB', 0),
                  _storageOption('256 GB', 1),
                  _storageOption('512 GB', 2),
                  _storageOption('1 TB', 3),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Description:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.product['Product Name'],
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              _shippingMethods(),
              _technicalSpecifications(),
              Row(
                children: [
                  const Text(
                    'Similar Products',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'see All',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFF2E21)),
                    ),
                  ),
                ],
              ),
              SimilarProducts(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 36, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.black)),
                      ),
                      child: const Text(
                        "Add To Cart",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF2E21),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 38, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "BUY NOW",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ExpansionTile _technicalSpecifications() {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: const EdgeInsets.all(8),
      title: const Text(
        'Technical Specifications',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Table(
            border: TableBorder.symmetric(
              inside: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            columnWidths: const {
              0: FlexColumnWidth(1.5),
              1: FlexColumnWidth(3),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.grey.shade200),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Feature',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Specification',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              ...specifications.map((spec) {
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        spec['Feature']!,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        spec['Specification']!,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  ExpansionTile _shippingMethods() {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      title: const Text(
        'Shipping Methods',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: List.generate(3, (index) {
              List<String> shippingMethods = [
                'Free Shipping (15 to 45 days)',
                'Standard Shipping - 8 US (7 to 15 days)',
                'Express Shipping - 28 US (3 to 7 days)'
              ];

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(
                        color: selectedShippingIndex == index
                            ? Colors.orange
                            : Colors.grey,
                      )),
                  child: ListTile(
                    title: Text(
                      shippingMethods[index],
                      style: const TextStyle(fontSize: 14),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedShippingIndex = index;
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: selectedShippingIndex == index
                                  ? const Color.fromARGB(255, 230, 225, 225)
                                  : Colors.grey,
                              width: 2),
                          color: selectedShippingIndex == index
                              ? Colors.orange
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _colorOption(String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColorIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        width: 66,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: selectedColorIndex == index ? Colors.black : Colors.grey,
              width: selectedColorIndex == index ? 2 : 1.5),
        ),
        child: Image.asset(
          image,
          scale: 2.5,
        ),
      ),
    );
  }

  Widget _storageOption(String size, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStrogeIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(
              color: selectedStrogeIndex == index ? Colors.black : Colors.grey,
              width: selectedStrogeIndex == index ? 2 : 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(size, style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
