class User {
  final int id;
  final String email;
  final String fullName;
  final String preferredLanguage;
  final DateTime createdAt;
  final DateTime? lastLogin;

  User({
    required this.id,
    required this.email,
    required this.fullName,
    this.preferredLanguage = 'en',
    required this.createdAt,
    this.lastLogin,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      preferredLanguage: map['preferredLanguage'] as String? ?? 'en',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      lastLogin: map['lastLogin'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastLogin'] as int)
          : null,
    );
  }
}
