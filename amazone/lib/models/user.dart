import 'dart:convert';


class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String type;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.type,
    required this.token,
  });

  // Convert User object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'type': type,
      'token': token,
    };
  }

  // Create User object from Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
    );
  }

  // Convert User object to JSON string
  String toJson() => json.encode(toMap());

  // Create User object from JSON string
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  // Create a copy of User with some properties changed
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? type,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      type: type ?? this.type,
      token: token ?? this.token,
    );
  }
}