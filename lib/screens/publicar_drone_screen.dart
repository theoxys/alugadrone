import 'package:alugadrone_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class PublicarDroneScreen extends StatefulWidget {
  @override
  _PublicarDroneScreenState createState() => _PublicarDroneScreenState();
}

class _PublicarDroneScreenState extends State<PublicarDroneScreen> {
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: FlatButton(child: Icon(Icons.arrow_back_ios, color: Colors.red),
          onPressed:(){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
            }
          ),
        title: Text("Anunciar drone", style: TextStyle(color: Colors.red),),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(25.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText:"Titulo do anuncio",
                icon: Icon(Icons.textsms),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
            )
          ],
        ),
      ),

    );
  }
}
