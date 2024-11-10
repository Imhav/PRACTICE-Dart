import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StateButton(),
              SizedBox(height: 20),
              StateButton(),
            ],
          ),
        ),
      ),
    ));

enum ButtonState {
  selected("Selected", Colors.white, Colors.blue),
  unselected("Not Selected", Colors.black, Colors.white);

  final String _label;
  final Color _text;
  final Color _background;

  const ButtonState(this._label, this._text, this._background);
  String get label => _label;
  Color get text => _text;
  Color get background => _background;
}

class StateButton extends StatefulWidget {
  const StateButton({super.key});

  @override
  State<StateButton> createState() => _StateButtonState();
}

class _StateButtonState extends State<StateButton> {
  bool onPressed = false;

  @override
  Widget build(BuildContext context) {
    ButtonState currentState =
        onPressed ? ButtonState.selected : ButtonState.unselected;

    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              onPressed = !onPressed;
            });
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: currentState.text,
            backgroundColor: currentState.background,
            textStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
          child: Center(
            child: Text(currentState.label),
          ),
        ),
      ),
    );
  }
}
