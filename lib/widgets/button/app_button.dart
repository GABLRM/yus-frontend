import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() press;

  const CustomButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow[200],
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
      ),
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Merienda',
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
