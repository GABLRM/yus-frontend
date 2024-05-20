import 'package:flutter/material.dart';
import 'package:yus_dev/repositories/post_repository.dart';
import 'package:yus_dev/utils/post_verification.dart';
import 'package:yus_dev/widgets/button/app_button.dart';
import 'package:yus_dev/widgets/input/app_input_label.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => PostFormState();
}

class PostFormState extends State<PostForm> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController contentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              LabelInput(label: 'Titre', controller: titleController),
              const SizedBox(
                height: 20,
              ),
              LabelInput(
                label: 'Contenu',
                controller: contentController,
                type: TextInputType.multiline,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                text: 'Publier',
                press: () {
                  addPost(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addPost(BuildContext context) async {
    String errorMessage =
        verificationPost(titleController.text, contentController.text);

    if (errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      createPost(titleController.text, contentController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post créé avec succès'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamed(context, '/home');
    }
  }
}
