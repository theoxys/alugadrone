import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel extends Model{

  FirebaseUser firebaseUser;
  bool isLoading = false;

  Future<Null> publishService({@required Map<String, dynamic> userData, @required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    Firestore.instance.collection("Serviços").document().setData(userData).then((value){
      isLoading = false;
      onSuccess();
      notifyListeners();
    }).catchError((e){
      onFail();
      isLoading = false;
      notifyListeners();
    });

  }
}