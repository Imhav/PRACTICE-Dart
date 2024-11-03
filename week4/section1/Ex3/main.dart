import 'package:flutter/material.dart';

enum Button {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color _colors;
  Color get colors => _colors;
  const Button(this._colors);
}

enum IconPosition { right, left }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icons;
  final IconPosition iconPosition;
  final Button buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icons,
    this.iconPosition = IconPosition.left,
    this.buttonType = Button.primary,
  });

  @override
  Widget build(BuildContext context) {
    final iconTextRow = [
      if (iconPosition == IconPosition.left) ...[
        Icon(icons, color: Colors.black),
        const SizedBox(width: 8), // Adjust this width as needed
        Text(label, style: const TextStyle(color: Colors.black, fontSize: 12)),
      ] else ...[
        Text(label, style: const TextStyle(color: Colors.black, fontSize: 12)),
        const SizedBox(width: 8), // Adjust this width as needed
        Icon(icons, color: Colors.black),
      ]
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: buttonType.colors,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: iconTextRow,
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Custom Button"),
      ),
      body: const Column(
        children: [
          CustomButton(
            label: "Submit",
            iconPosition: IconPosition.left,
            icons: Icons.check,
          ),
          CustomButton(
            label: "Time",
            icons: Icons.watch_later,
            iconPosition: IconPosition.right,
            buttonType: Button.secondary,
          ),
          CustomButton(
            label: "account",
            icons: Icons.pie_chart_outline,
            iconPosition: IconPosition.right,
            buttonType: Button.disabled,
          ),
        ],
      ),
    ),
  ));
}
