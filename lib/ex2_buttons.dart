import 'package:flutter/material.dart';

// EX 2 – The buttons (handout page: EX 2)
// A StatelessWidget called CustomButton. Use one enum for the button type
// and one enum for the icon position.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Button'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: 'Submit', icon: Icons.check),
              CustomButton(label: 'Time', icon: Icons.access_time, iconPosition: IconPosition.right, type: ButtonType.secondary),
              CustomButton(label: 'Account', icon: Icons.account_tree, iconPosition: IconPosition.right, type: ButtonType.disable),
            ],
          ),
        ),
      ),
    ),
  );
}

enum ButtonType { primary, secondary, disable }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {

  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary
  });

  Color get getButtonColor{
    switch (type) {
      case ButtonType.primary:
      return Colors.blue;
      case ButtonType.secondary:
      return Colors.green;
      case ButtonType.disable:
      return Colors.grey.shade300;
    }
  }

  Color get getTextColor {
    switch (type) {
      case ButtonType.disable:
        return Colors.grey.shade600;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: getButtonColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(iconPosition == IconPosition.left) ... [
              Icon(icon, color: getTextColor),
              const SizedBox(width: 8)
            ],

            Text(
              label,
              style: TextStyle(
                color: getTextColor,
                fontSize: 16
              ),
            ),

            if (iconPosition == IconPosition.right) ... [
              const SizedBox(width: 8),
              Icon(icon, color: getTextColor)
            ]
          ],
        ),
        ),
    );
  }
}