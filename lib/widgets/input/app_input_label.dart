import 'package:flutter/material.dart';

class LabelInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const LabelInput({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            hintText: label,
          ),
          style: const TextStyle(
            height: 1,
          ),
        ),
      ],
    );
  }
}
