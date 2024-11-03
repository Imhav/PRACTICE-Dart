import 'package:flutter/material.dart';

enum Product {
  dart("Dart", "the best object language", "flutterImage/dart.png"),
  flutter(
      "Flutter", "the best mobile widget library", "flutterImage/flutter.png"),
  firebase("Firebase", "the best cloud database", "flutterImage/firebase.png");

  final String _title;
  final String _description;
  final String _image;

  String get title => _title;
  String get description => _description;
  String get image => _image;

  const Product(this._title, this._description, this._image);
  @override
  String toString() => "$title, $description, $_image";
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 20), 
              child: Image(
                image: AssetImage(product.image),
                width: 80,
                height: 80,
                alignment: Alignment.topLeft,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                product.title,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Text(
                product.description,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
