import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;

  const SearchBox({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        TextField(
          controller: controller,

          decoration: InputDecoration(
            hintText: "🔍 Search any word...",
            filled: true,
            fillColor: Colors.white10,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,

          child: ElevatedButton(
            onPressed: onPressed,

            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),

            child: const Text(
              "Explore 🌌",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}