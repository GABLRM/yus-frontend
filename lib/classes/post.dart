class Post {
  final String id;
  final String title;
  final String content;
  final String userId;

  const Post({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        '_id': String id,
        'title': String title,
        'content': String content,
        'user_id': String userId,
      } =>
        Post(
          id: id,
          title: title,
          content: content,
          userId: userId,
        ),
      _ => throw const FormatException('Failed to load Post.'),
    };
  }
}
