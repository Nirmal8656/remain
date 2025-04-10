import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        fontFamily: 'Arial',
        primarySwatch: Colors.blue,
      ),
      home: const ProductPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'purifier 1',
      'price': 'Rs 22,000',
      'image': [
        'assets/image_one.png',
        'assets/image_3.png',
      ],
    },
    {
      'title': 'purifier 2',
      'price': 'Rs 20,000',
      'image': [
        'assets/image_one.png',
        'assets/image_3.png',
      ],
    },
    {
      'title': 'purifier 3',
      'price': 'Rs 15,000',
      'image': ['assets/image_3.png','assets/image_one.png'],
    },
    {
      'title': 'purifier 4',
      'price': 'Rs 18,500',
      'image': ['assets/image_4.png','assets/image_one.png'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products List',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final List<String> images = List<String>.from(item['image']);

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: item),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(15),
              child: Card(
                elevation: 0,
                color: Colors.blue[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.only(bottom: 15),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Hero(
                        tag: item['title'],
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            images[0],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)),
                            const SizedBox(height: 4),
                            Text(item['price'],
                                style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final List<String> images = List<String>.from(product['image']);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
                child: Hero(
                  tag: product['title'],
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 180,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      viewportFraction: 0.9,
                    ),
                    items: images.map((imgPath) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          imgPath,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(102),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withAlpha(30),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product['title'],
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product['price'],
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Product Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "This is a high-quality water purifier with advanced filtration technology to ensure safe and healthy drinking water for you and your family.",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
