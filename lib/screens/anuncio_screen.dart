import 'package:alugadrone_app/data/anuncio_data.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/foundation.dart';
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

    final Color primary_color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(anuncio.modelo_drone),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: anuncio.image.map((url){
                return NetworkImage(url);
              }).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: primary_color,
              autoplay:  false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  anuncio.modelo_drone,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                  ),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${anuncio.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: primary_color
                  ),
                ),
                SizedBox(height: 16.0,),
                SizedBox(
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: (){},
                    child: Text(
                      "Contratar Serviços",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    color: primary_color,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  anuncio.description,
                  style: TextStyle(
                    fontSize: 16.0
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

