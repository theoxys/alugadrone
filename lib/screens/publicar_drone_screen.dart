import 'package:alugadrone_app/models/service_model.dart';
import 'package:alugadrone_app/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:day_selector/day_selector.dart';
import 'package:brasil_fields/brasil_fields.dart';

class PublicarDroneScreen extends StatefulWidget {
  @override
  _PublicarDroneScreenState createState() => _PublicarDroneScreenState();
}

class _PublicarDroneScreenState extends State<PublicarDroneScreen> {

  FirebaseUser firebaseUser;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _marcaController = TextEditingController();
  final _modeloController = TextEditingController();
  final _sisantController = TextEditingController();
  final _autonomiaController = TextEditingController();
  final _resolucaoController = TextEditingController();
  final _descController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _precoController = TextEditingController();






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
        body: ScopedModel<ServiceModel>(
            model: ServiceModel(),
            child: ScopedModelDescendant<ServiceModel>(
                builder: (context, child, model){
                  if(model.isLoading)
                    return Center(
                        child: SpinKitWave(
                          color: Colors.red,
                          size: 60.0,
                        )
                    );

                  return Form(
                    key: _formKey,
                    child: ListView(
                      padding: EdgeInsets.all(25.0),
                      children: <Widget>[
                        Text("Descrição do drone"),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: _marcaController,
                          decoration: InputDecoration(
                            hintText:"Marca",
                            icon: Icon(Icons.brightness_auto),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: _modeloController,
                          decoration: InputDecoration(
                            hintText:"Modelo",
                            icon: Icon(Icons.airplanemode_active),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: _sisantController,
                          decoration: InputDecoration(
                            hintText:"Identificação SISANT",
                            icon: Icon(Icons.credit_card),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: _autonomiaController,
                          decoration: InputDecoration(
                            hintText:"Autonomia",
                            icon: Icon(Icons.shutter_speed),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: _resolucaoController,
                          decoration: InputDecoration(
                            hintText:"Máxima resolução de gravação",
                            icon: Icon(Icons.camera_alt),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Text("Descrição do Serviço"),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: _descController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText:"Descreva aqui em um breve texto\n o tipo de serviço que você está\n oferecendo ao seu cliente!",
                            icon: Icon(Icons.textsms),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: _cidadeController,
                          decoration: InputDecoration(
                            hintText:"Cidade de operação",
                            icon: Icon(Icons.location_on),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            RealInputFormatter(),
                          ],
                          controller: _precoController,
                          decoration: InputDecoration(
                            prefixText: "R\$: ",
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
                          mode: DaySelector.full,
                        ),
                        SizedBox(height: 20.0,),
                        SizedBox(
                          height: 50.0,
                          child:  RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: (){
                                Map<String, dynamic> serviceData = {
                                  //"user": firebaseUser.uid,
                                  "marca": _marcaController.text,
                                  "modelo": _modeloController.text,
                                  "sisant": _sisantController.text,
                                  "autonomia": _autonomiaController.text,
                                  "resolucao": _resolucaoController.text,
                                  "descricao": _descController.text,
                                  "cidade": _cidadeController.text,
                                  "preco": _precoController.text
                                };
                                ServiceModel().publishService(userData: serviceData, onSuccess: _onSuccess, onFail: _onFail);

                              },
                              padding: EdgeInsets.symmetric(horizontal: 118.0),
                              child: Text("Publicar!",
                                textAlign: TextAlign.center,)
                          ),
                        ),
                      ],
                    ),
                  );
                }
            )

        )

    );
  }

  void _onSuccess(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Feito!", textAlign: TextAlign.center,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('img/droneSuccess.png'),
            SizedBox(height: 30.0,),
            Text("Serviço publicado com sucesso!")
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      );
    });

  }
  void _onFail(){

  }
}
