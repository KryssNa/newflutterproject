


import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  UserModel({
    this.id,
    this.userId,
    this.fullName,
    this.username,
    this.phone,
    this.imageUrl,
    this.imagePath,
    this.fcm,
    this.email,
    this.password,
  });
  String? id;
  String? userId;
  String? fullName;
  String? username;
  String? phone;
  String? imageUrl;  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    userId: json["user_id"],
    fullName: json["name"],
    username: json["username"],
    phone: json["phone"],
    imageUrl: json["imageUrl"],
    imagePath: json["imagePath"],
    fcm: json["fcm"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": fullName,
    "username": username,
    "phone": phone,
    "imageUrl": imageUrl,
    "imagePath": imagePath,
    "fcm": fcm,
    "email": email,
    "password": password,
  };
  factory UserModel.fromFirebaseSnapshot(DocumentSnapshot<Map<String, dynamic>> json) => UserModel(
    id: json.id,
    userId: json["user_id"],
    fullName: json["name"],
    username: json["username"],
    phone: json["phone"],
    imageUrl: json["imageUrl"],
    imagePath: json["imagePath"],
    fcm: json["fcm"],
    email: json["email"],
    password: json["password"],
  );
  String? imagePath;
  String? fcm;
  String? email;
  String? password;
}