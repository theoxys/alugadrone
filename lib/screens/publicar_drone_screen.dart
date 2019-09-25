import 'package:alugadrone_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:day_selector/day_selector.dart';

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
            Text("Descrição do drone"),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText:"Marca",
                icon: Icon(Icons.brightness_auto),
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText:"Modelo",
                icon: Icon(Icons.airplanemode_active),
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText:"Identificação SISANT",
                icon: Icon(Icons.credit_card),
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText:"Autonomia",
                icon: Icon(Icons.shutter_speed),
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText:"Máxima resolução de gravação",
                icon: Icon(Icons.camera_alt),
              ),
            ),
            SizedBox(height: 20.0,),
            Text("Descrição do Serviço"),
            SizedBox(height: 20.0,),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText:"Descreva aqui em um breve texto\n o tipo de serviço que você está\n oferecendo ao seu cliente!",
                icon: Icon(Icons.textsms),
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText:"Cidade de operação",
                icon: Icon(Icons.location_on),
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText:"Preço por hora",
                icon: Icon(Icons.attach_money),
              ),
            ),
            SizedBox(height: 20.0,),
            Text("Dias disponiveis"),
            SizedBox(height: 20.0,),
                DaySelector(
                    value: null,
                    onChange: (value) {},
                    color: Colors.white,
                    mode: DaySelector.modeFull,
                ),
          ],
        ),
      ),

    );
  }
}
