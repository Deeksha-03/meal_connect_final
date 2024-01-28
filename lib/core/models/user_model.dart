import 'dart:io';
import 'dart:js_interop';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:meal_connect/core/app_export.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String type;

  const UserModel({
    this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.type,
  });

  toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "type": type,
    };
  }

  factory UserModel.fromSapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        email: data["email"],
        name: data["name"],
        password: data["password"],
        type: data["type"]);
  }
  Future<String> uploadImage(String path, XFile image) async{
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }  catch(e){
      throw "something is wrong";
    }
  }
}
