  import 'package:flutter/material.dart';

  // EX 3 – The products (handout page: EX 3)
  // Part 1: build ONE product card (images are in assets/ex3/).
  // Part 2: create the Product enum (follow the UML in the handout).
  // Part 3: extract the card into a StatelessWidget called ProductCard.

  void main() {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Products')
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: Product.values.map((product) => ProductCard(product: product)).toList(),
            ),
            ),
        ),
      ),
    );
  }

enum Product {
  dart(
    title: 'Dart',
    description: 'The best object language',
    image: 'assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'The best mobile widget library',
    image: 'assets/ex3/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'The best cloud database',
    image: 'assets/ex3/firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image
  });
}

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.image,
              height: 80
            ),
            const SizedBox(height: 12),
            const Text(
              'Dart',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey
              ),
            )
          ],
        ),
      ),
    );
  }
}
