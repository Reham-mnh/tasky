import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.maxLines=1,
    this.controller,

  });
  final String title;
  final String hintText;
  final int maxLines;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.displayLarge?.copyWith(fontSize: 16),
        ),
        SizedBox(height: 8),
         TextField(
          style: const TextStyle(color: Colors.white),
          controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: Color(0xff6D6D6D)),
              filled: true,
              fillColor: Color(0xff282828),
            ),
         
        ),
      ],
    );
  }
}
