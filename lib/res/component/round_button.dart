import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;
  final Color color;
  final Color textColor;
  final double height; // Added height property
  final double width; // Added width property

  const RoundButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.loading = false,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.height = 44, // Default height
    this.width = double.infinity, // Default width to take full space
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: height, // Dynamic height
        width: width, // Dynamic width
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(11), // Rounded corners
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
