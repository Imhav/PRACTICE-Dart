import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: ListView(
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            for (var color in colors) Text(color),
            const Label("Method 2: Map", bold: true),
            ...colors.map((color) => Text(color)),
            const Label("Method 3: Dedicated Function", bold: true),
            ...getColors(),
          ],
        ),
      ),
    ),
  ));
}

List<String> colors = ["red", "blue", "green"];

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

List<Widget> getColors() {
  return colors.map((color) => Text(color)).toList();
}
//Q1
//Readability: 
//-(Loop Directly or for loop) This method is quite straightforward and easy to understand for anyone familiar with loops.
//Maintainability: 
//-(map() method) easy to maintain as the mapping logic is separated and the list of items can be easily modified.
//Performance:
//-Dedicated Function is ideal for more complex transformations or when the logic needs to be reused. It keeps your main UI code cleaner and more maintainable.
