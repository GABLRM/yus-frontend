import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Yu's",
      style: TextStyle(
        color: Colors.black, fontSize: 80, fontWeight: FontWeight.w800
      ),
    );
  }
}
