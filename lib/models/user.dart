// ignore_for_file: public_member_api_docs, sort_constructors_first
// WE CREATED THIS USER MODEL  OR YOU CAN SAY THIS STRUCTURE OF USER AND THIS IS THE CLIENT OR USER SIDE AND THA T WAS THE SERVER SIDE I GUESS IN HERE WE CREATING toMap & fromMap FUNCTIONS TO USE IN OTHER PLACES AND WE ALSO CREATED toJson & fromJson FUNCTIONS To USE .IN toMap & fromMap WE ARE USING MAPS AND IN toJson & fromJson WE ARE USING JSONS AND IN toMap WE ARE CONVERTING THE USER OBJECT TO MAP AND IN fromMap WE ARE CONVERTING THE MAP TO USER OBJECT AND IN toJson WE ARE CONVERTING THE USER OBJECT TO JSON AND IN fromJson WE ARE CONVERTING THE JSON TO USER OBJECT AND WE ARE USING THIS USER;
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
    id: map['_id'] ?? '',
    name: map['name'] ?? '',
    email: map['email'] ?? '',
    password: map['password'] ?? '',
    address: map['address'] ?? '',
    type: map['type'] ?? '',
    token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
