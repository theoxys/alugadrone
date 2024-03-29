import 'package:alugadrone_app/data/anuncio_data.dart';
import 'package:alugadrone_app/screens/anuncio_screen.dart';
import 'package:flutter/material.dart';

class AnuncioTile extends StatelessWidget {

  final String type;
  final AnuncioData anuncio;

  AnuncioTile(this.type, this.anuncio);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>AnuncioScreen(anuncio))
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child:
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(15.0),
                    child: Image.network(
                      anuncio.image[0],
                      fit: BoxFit.cover,
                      height: 180.0,
                    ),
                  )
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text(anuncio.modelo_drone,
                          style: TextStyle(
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          "R\$ ${anuncio.price.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          anuncio.region,
                          style: TextStyle(
                              fontWeight: FontWeight.w200
                          ),
                        ),

                      ],
                    ),
                  ),

                )
              ]
            )
      ),
    );
  }
}
