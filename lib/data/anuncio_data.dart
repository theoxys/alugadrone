import 'package:cloud_firestore/cloud_firestore.dart';

class AnuncioData{

  String id;

  String modelo_drone;
  String description;
  String services;
  String region;
  double price;

  List image;

  AnuncioData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;

    modelo_drone = snapshot.data["modelo_drone"];
    price = snapshot.data["price"] + 0.0;
    region = snapshot.data["region"];
    description = snapshot.data["description"];
    services = snapshot.data["services"];
    image = snapshot.data["image"];
  }


}