import 'package:alugadrone_app/models/user_model.dart';
import 'package:alugadrone_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {

  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _passController = TextEditingController();
  final _confPassController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    createAlertDialog(BuildContext context){
      return showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Ops!"),
          content: Text("CPF Invalido"),
        );
      });
    }

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.grey
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight

          )
      ),
    );

    return Scaffold(
        body:
        Stack(
          children: <Widget>[
            _buildBodyBack(),
            ScopedModelDescendant<UserModel>(
                builder: (context, child, model){
                  if(model.isLoading)
                    return Center(
                        child: SpinKitWave(
                          color: Colors.red,
                          size: 60.0,
                        )
                    );
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      leading:
                      new FlatButton(key:null, onPressed:(){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                          child:
                          new Icon(Icons.keyboard_arrow_left, color: Colors.red,)
                      ),
                      title: const Text('Novo cadastro!', style: TextStyle(color: Colors.red),),
                      centerTitle: true,
                    ),
                    body: Form(
                        key: _formKey,
                        child: ListView(
                          padding: EdgeInsets.all(40.0),
                          children: <Widget>[
                            SizedBox(height: 25.0,),
                            TextFormField(
                              validator: (text){
                                if (text.isEmpty)
                                  return "Nome Invalido!";
                              },
                              controller: _nomeController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: "Nome",
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            TextFormField(
                              validator: (text){
                                if (text.isEmpty || !text.contains("@"))
                                  return "Email ivalido!";
                              },
                              controller: _emailController,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.email),
                                  hintText: "Email"
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 20.0,),
                            TextFormField(
                              validator: (text){
                                if (text.isEmpty || text.length < 6)
                                  return "Senha ivalida!";
                              },
                              controller: _passController,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  hintText: "Senha"
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 20.0,),
                            TextFormField(
                              validator: (text){
                                if (text.isEmpty || text.length != _passController.text.length || !text.contains(_passController.text))
                                  return "As senhas não batem!";
                              },
                              controller: _confPassController,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  hintText: "Confirmar senha!"
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 20.0,),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (text){
                                if (text.isEmpty || text.length < 11 || text.length > 11)
                                  return "CPF Invalido!";
                              },
                              controller: _cpfController,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.credit_card),
                                  hintText: "CPF"
                              ),
                            ),
                            SizedBox(height: 100.0,),
                            SizedBox(
                              height: 50.0,
                              child:  RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0)
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  onPressed: (){
                                    if(_formKey.currentState.validate()){
                                      if(CPFValidator.isValid(_cpfController.text) == true){

                                        Map<String, dynamic> userData = {
                                          "nome": _nomeController.text,
                                          "email": _emailController.text,
                                          "cpf": _cpfController.text
                                        };
                                        model.signUp(
                                            userData: userData,
                                            pass: _passController.text,
                                            onSuccess: _onSuccess,
                                            onFail: _onFail);
                                      }else{
                                        createAlertDialog(context);
                                      }
                                    }
                                  },
                                  padding: EdgeInsets.symmetric(horizontal: 118.0),
                                  child: Text("Enviar!",
                                    textAlign: TextAlign.center,)
                              ),
                            ),
                          ],
                        )
                    ),
                  );
                }),
          ],
        )
    );
  }

  void _onSuccess(){

  }
  void _onFail(){


  }



}


