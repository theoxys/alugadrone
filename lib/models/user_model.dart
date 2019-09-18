import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'dart:async';

class UserModel extends Model{

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  void signUp({@required Map<String, dynamic> userData, @required String pass, @required VoidCallback onSuccess, @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: pass
    ).then((user) async {
      firebaseUser = user;

      await _saveUserData(userData);

      onSuccess();
      isLoading = false;
      notifyListeners();

    }).catchError((e){

      onFail();
      isLoading = false;
      notifyListeners();

    });
  }

  void signIn(){
  isLoading = true;
  notifyListeners();
  }

  void recoverPassword(){
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;

    Firestore.instance.collection("Users").document(firebaseUser.uid).setData(userData);
  }

}