import 'package:alugadrone_app/models/user_model.dart';
import 'package:alugadrone_app/screens/login_screen.dart';
import 'package:alugadrone_app/screens/pedidos_screen.dart';
import 'package:alugadrone_app/screens/perfil_screen.dart';
import 'package:alugadrone_app/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.grey
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );

    return Drawer(
        child: Stack(
          children: <Widget>[
            _buildDrawerBack(),
            ScopedModelDescendant<UserModel>(
              builder: (context, child, model){
                model.loadCurrentUser();
                if (model.isLoggedIn() == true){
                  return ListView(
                      padding: EdgeInsets.only(left: 32.0, top: 16.0),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                          padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                          height: 230.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 8.0,
                                left: 0.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Aluga Drone",
                                      style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 15.0,),
                                    CircleAvatar(
                                      backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png'),
                                      radius: 40.0,
                                    ),
                                    SizedBox(height: 15.0,),
                                    Text("Olá ${model.userData["nome"]}",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>PerfilScreen())
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.person_pin),
                                Text("Ver Perfil")
                              ],
                            )),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>PedidosScreen())
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.playlist_add_check),
                                Text("Meus pedidos")
                              ],
                            )),
                        FlatButton(
                            onPressed: () {
                              model.signOut();
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>LoginScreen())
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.subdirectory_arrow_left),
                                Text("Logout")
                              ],
                            )),

                      ],
                    );
                }

                if(model.isLoggedIn() == false){
                  return ListView(
                    padding: EdgeInsets.only(left: 32.0, top: 16.0),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                        height: 230.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 8.0,
                              left: 0.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("Aluga Drone",
                                    style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15.0,),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png'),
                                    radius: 40.0,
                                  ),
                                  SizedBox(height: 15.0,),
                                  Text("Você não esta logado!",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  GestureDetector(
                                      child: Text("Entre ou Cadastre-se!",
                                        style: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context)=>LoginScreen())
                                        );
                                      }
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                }
              }
            )
          ],
        )
    );
  }
}
