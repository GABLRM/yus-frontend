import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final String title;
  final String content;
  final String username;
  final String createdAt;

  const PostContainer(
      {super.key,
      required this.title,
      required this.content,
      required this.username,
      required this.createdAt});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9,
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 15),
      margin: const EdgeInsets.only(top: 15),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow[400]!, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Text(
                  createdAt,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
