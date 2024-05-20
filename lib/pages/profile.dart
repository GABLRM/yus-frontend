import 'package:flutter/material.dart';
import 'package:yus_dev/classes/post.dart';
import 'package:yus_dev/classes/user.dart';
import 'package:yus_dev/repositories/post_repository.dart';
import 'package:yus_dev/repositories/user_repository.dart';
import 'package:yus_dev/widgets/post/app_post.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<User> futureUser;
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUserConnected();
    futurePost = fetchPostUser();
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: FutureBuilder<User>(
              future: futureUser,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data!;
                  return Column(
                    children: [
                      Text(
                        user.username,
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '${user.lastname} ${user.firstname}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Biographie",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            Text(
                              user.biography ?? '',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.grey),
                            ),
                            const SizedBox(height: 10),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "Mes Publications",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<List<Post>>(
                          future: futurePost,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final posts = snapshot.data!;
                              return ListView.builder(
                                itemCount: posts.length,
                                itemBuilder: (context, index) {
                                  final post = posts[index];
                                  return PostContainer(
                                    title: post.title,
                                    content: post.content,
                                    username: post.userId,
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
