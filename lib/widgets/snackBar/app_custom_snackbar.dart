import 'package:flutter/material.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent(
      {super.key, required this.errorText, this.containerColor, this.title});

  final String errorText;
  final Color? containerColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 90,
      decoration: BoxDecoration(
          color: containerColor ?? Colors.red,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          const SizedBox(width: 48),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "Oups !",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  errorText,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
