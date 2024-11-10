import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner:
          false, // WE MAKE THE DEBUG POP-UP AT THE TOP RIGHT OF THE SCREEN DISSAPPEAR.
      home: ImageGallery(),
    ));

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: () {
              setState(() {
                counter = (counter - 1) % images.length;
                if (counter < 0) {
                  counter = images.length - 1;
                }
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: () {
                setState(() {
                  counter = (counter + 1) % images.length;
                });
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[counter]),
      ),
    );
  }
}
