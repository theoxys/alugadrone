import 'package:alugadrone_app/models/user_model.dart';
import 'package:alugadrone_app/screens/publicar_drone_screen.dart';
import 'package:alugadrone_app/tabs/home_tab.dart';
import 'package:alugadrone_app/screens/search_screen.dart';
import 'package:alugadrone_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  final pageController = PageController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(pageController),
      body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Scaffold(
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      leading: FlatButton(child: Image.asset('img/menuIcon.png', color: Colors.red,), onPressed:()=> scaffoldKey.currentState.openDrawer()),
                      floating: true,
                      brightness: Brightness.light,
                      snap: true,
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      flexibleSpace: FlexibleSpaceBar(
                          title: const Text("Feed",
                            style: TextStyle(
                                color: Colors.red
                            ),
                          ),
                          centerTitle: true
                      ),
                    ),

                    HomeTab()
                  ],
                ),
                floatingActionButton: ScopedModelDescendant<UserModel>(
                  builder: (context, child, model){
                    return Visibility(child: FloatingActionButton.extended(
                    onPressed: () {
                    // Add your onPressed code here!
                    },
                    label: Text('Publicar!'),
                    icon: Icon(Icons.publish),
                    elevation: 44.0,
                    backgroundColor: Colors.red,
                    ),
                    visible: !model.isLoggedIn() ? false : true,);
                    }
                ),
            ),
            Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                backgroundColor: Colors.white,
                brightness: Brightness.light,
                leading: FlatButton(child: Image.asset('img/menuIcon.png', color: Colors.red,), onPressed:()=> scaffoldKey.currentState.openDrawer()),
                title: Text("Buscar serviço", style: TextStyle(color: Colors.red),),
                centerTitle: true,
              ),
              body: SearchScreen(),
              floatingActionButton: ScopedModelDescendant<UserModel>(
                  builder: (context, child, model){
                    return Visibility(child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>PublicarDroneScreen())
                        );
                      },
                      label: Text('Anunciar!'),
                      icon: Icon(Icons.add_to_photos),
                      elevation: 44.0,
                      backgroundColor: Colors.red,
                    ),
                      visible: !model.isLoggedIn() ? false : true,);
                  }
              ),
            ),
            Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                backgroundColor: Colors.white,
                brightness: Brightness.light,
                leading: FlatButton(child: Image.asset('img/menuIcon.png', color: Colors.red,), onPressed:()=> scaffoldKey.currentState.openDrawer()),
                title: Text("Buscar Serviços", style: TextStyle(color: Colors.red),),
                centerTitle: true,
              ),
              body: SearchScreen(),
              floatingActionButton: ScopedModelDescendant<UserModel>(
                  builder: (context, child, model){
                    return Visibility(child: FloatingActionButton.extended(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      label: Text('Anunciar!'),
                      icon: Icon(Icons.add_to_photos),
                      elevation: 44.0,
                      backgroundColor: Colors.red,
                    ),
                      visible: !model.isLoggedIn() ? false : true,);
                  }
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            ),
          ]
      ),
      bottomNavigationBar: FancyBottomNavigation(
    tabs: [
    TabData(iconData: Icons.photo_library, title: "Feed"),
    TabData(iconData: Icons.search, title: "Drones"),
    TabData(iconData: Icons.shopping_cart, title: "Serviços")
    ],
    onTabChangedListener: (index) {
      pageController.jumpToPage(index);
      },
      )
    );
  }

  void openDrawerHome(){
    scaffoldKey.currentState.openDrawer();
  }
}


/*CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 150),
        color: Colors.red,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.photo_library, size: 30, color: Colors.white,),
          Icon(Icons.search, size: 30,color: Colors.white,),
          Icon(Icons.settings, size: 30,color: Colors.white,),
        ],
        onTap: (index) {
          pageController.jumpToPage(index);
        },
      ),*/