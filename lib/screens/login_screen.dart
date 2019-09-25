import 'package:alugadrone_app/models/user_model.dart';
import 'package:alugadrone_app/screens/cadastro_screen.dart';
import 'package:alugadrone_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {

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

                return Form(child: ListView(
                  padding: EdgeInsets.all(40.0),
                  children: <Widget>[
                    SizedBox(height: 25.0,),
                    Image.asset('img/logoBranco.png',
                      fit: BoxFit.scaleDown,
                      color: Colors.red,
                      height: 185.0,
                      width: 185.0,
                    ),
                    SizedBox(height: 50.0,),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: "Email"
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      controller: _passController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: "Senha"
                      ),
                      obscureText: true,
                    ),
                    FlatButton(onPressed: null, child: Text("Esqueci minha senha!",)),
                    SizedBox(height: 50.0,),
                    SizedBox(
                      height: 50.0,
                      child:  RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: (){
                            model.signIn(email: _emailController.text, pass: _passController.text, onSuccess: _onSuccess, onFail: _onFail);
                          },
                          padding: EdgeInsets.symmetric(horizontal: 118.0),
                          child: Text("Entrar!")
                      ),
                    ),
                    FlatButton(onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>CadastroScreen()));
                    }, child: Text("Criar uma conta!",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),)),
                  ],
                )
                );
              },
            )
          ],
        )
    );
  }
  void _onSuccess(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
  }
  void _onFail(){

  }
}
