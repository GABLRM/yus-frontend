import 'package:flutter/material.dart';
import 'package:yus_dev/classes/post.dart';
import 'package:yus_dev/repositories/post_repository.dart';
import 'package:yus_dev/widgets/post/app_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Yu's",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.yellow[200],
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.add), iconSize: 30, ),
        ],
      ),
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
              
          child: Column(children: [
            FutureBuilder<List<Post>>(
              future: futurePost,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final posts = snapshot.data!; // Access the list of posts
                  return SingleChildScrollView(
                      child: Column(children: [
                    for (final post in posts)
                      PostContainer(
                        title: post.title,
                        content: post.content,
                        username: post.userId,
                      ),
                      const SizedBox(height: 20),
                  ]));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ]),
        )),
      ),
    );
  }
}
