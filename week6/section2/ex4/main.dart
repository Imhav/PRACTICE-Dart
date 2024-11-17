import 'package:flutter/material.dart';
import 'data/joke.dart';  

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FavoriteJokeCard(),
    ),
  );
}

class FavoriteJokeCard extends StatefulWidget {
  const FavoriteJokeCard({super.key});

  @override
  State<FavoriteJokeCard> createState() => _FavoriteJokeCardState();
}

class _FavoriteJokeCardState extends State<FavoriteJokeCard> {
  int? _bestJokeIndex;

  void onFavoriteClick(int index) {
    setState(() {
      _bestJokeIndex = _bestJokeIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: joke.tiles.length, // Using the joke instance
        itemBuilder: (context, index) {
          var tile = joke.tiles[index];  // Accessing the tile from the joke instance
          return FavoriteCard(
            title: tile.title,  // Using the title from the tile
            description: tile.description,  // Using the description from the tile
            isFavorite: _bestJokeIndex == index,
            onFavoriteClick: () => onFavoriteClick(index),
          );
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({super.key, 
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

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
                      title,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      description,
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onFavoriteClick,
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
