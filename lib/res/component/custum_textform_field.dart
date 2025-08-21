import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged; // Add this line

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
    this.validator,
    this.suffixIcon,
    this.onChanged, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator,
          onChanged: onChanged, // Use the onChanged callback here
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue, // 🔵 Focused border color
                width: 1,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey, // 🟠 Unfocused border color
                width: 1.0,
              ),
            ),
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(
              horizontal: width * 0.04, // 4% of screen width for padding
              vertical: height * 0.015, // 1.5% of screen height for padding
            ),
          ),
        ),
      ],
    );
  }
}
