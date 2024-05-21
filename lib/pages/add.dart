import 'package:flutter/material.dart';
import 'package:yus_dev/widgets/form/post_form_widget.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Yu's",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[200],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                PostForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
