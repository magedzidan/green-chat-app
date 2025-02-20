import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final String? imageUrl;
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.imageUrl,
  });
 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, password: $password, imageUrl: $imageUrl)';
  }
}
