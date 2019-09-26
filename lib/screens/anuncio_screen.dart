import 'package:alugadrone_app/data/anuncio_data.dart';
import 'package:flutter/material.dart';

class AnuncioScreen extends StatefulWidget {

  final AnuncioData anuncio;

  AnuncioScreen(this.anuncio);

  @override
  _AnuncioScreenState createState() => _AnuncioScreenState(anuncio);
}

class _AnuncioScreenState extends State<AnuncioScreen> {

  final AnuncioData anuncio;

  _AnuncioScreenState(this.anuncio);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

