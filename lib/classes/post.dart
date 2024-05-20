class Post {
  final String id;
  final String title;
  final String content;
  final String userId;
  final String createdAt;

  const Post({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        '_id': String id,
        'title': String title,
        'content': String content,
        'user_id': String userId,
        'created_at': String createdAt,
      } =>
        Post(
          id: id,
          title: title,
          content: content,
          userId: userId,
          createdAt: createdAt,
        ),
      _ => throw const FormatException('Failed to load Post.'),
    };
  }
}
