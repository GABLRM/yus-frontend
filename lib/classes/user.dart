class User {
  final String id;
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String? biography;

  const User({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    this.biography,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        '_id': String id,
        'username': String username,
        'firstname': String firstname,
        'lastname': String lastname,
        'email': String email,
        'biography': String? biography,
      } =>
        User(
          id: id,
          username: username,
          firstname: firstname,
          lastname: lastname,
          email: email,
          biography: biography,
        ),
      {
        '_id': String id,
        'username': String username,
        'firstname': String firstname,
        'lastname': String lastname,
        'email': String email,
      } =>
        User(
          id: id,
          username: username,
          firstname: firstname,
          lastname: lastname,
          email: email,
        ),
      _ => throw const FormatException('Failed to load User.'),
    };
  }
}
