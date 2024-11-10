import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              "Favorite cards",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: const [
              FavoriteCard(
                title: "Title1",
                description: "Description1",
              ),
              FavoriteCard(
                title: "Title2",
                description: "Description2",
              ),
              FavoriteCard(
                title: "Title3",
                description: "Description3",
              ),
            ],
          )),
    ));

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;

  const FavoriteCard(
      {super.key, required this.title, required this.description});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black)),
          ),
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.description,
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
