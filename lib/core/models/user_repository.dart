import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/core/models/user_model.dart';

class UserRepository extends  GetxController{
  static UserRepository get instance => Get.find();
  
  final _db = FirebaseFirestore.instance;
  createUser(UserModel user) async{
   await _db.collection("users").add(user.toJson());

  }
  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db.collection("users").where("email", isEqualTo: email).get();
    if (snapshot.docs.isNotEmpty) {
      final userData = snapshot.docs.map((e) => UserModel.fromSapshot(e)).single;
      return userData;
    } else {
      // Handle the case when the user document does not exist
      throw Exception("User not found");
    }

  }

}