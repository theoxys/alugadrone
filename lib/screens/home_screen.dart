import 'package:alugadrone_app/tabs/home_tab.dart';
import 'package:alugadrone_app/screens/search_screen.dart';
import 'package:alugadrone_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
                      leading: FlatButton(child: Image.asset('img/menuIcon.png'), onPressed:()=> scaffoldKey.currentState.openDrawer()),
                      floating: true,
                      snap: true,
                      backgroundColor: Colors.red,
                      elevation: 0.0,
                      flexibleSpace: FlexibleSpaceBar(
                          title: const Text("Feed",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          centerTitle: true
                      ),
                    ),

                    HomeTab()
                  ],
                )
            ),
            Scaffold(
              appBar: AppBar(
                leading: FlatButton(child: Image.asset('img/menuIcon.png'), onPressed:()=> scaffoldKey.currentState.openDrawer()),
                title: Text("Buscar drone"),
                centerTitle: true,
              ),
              body: SearchScreen(),
            ),
            Scaffold(
              appBar: AppBar(
                leading: FlatButton(child: Image.asset('img/menuIcon.png'), onPressed:()=> scaffoldKey.currentState.openDrawer()),
                title: Text("Buscar Serviços"),
                centerTitle: true,
              ),
              body: SearchScreen(),
            ),
          ]
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 150),
        color: Colors.red,
        items: <Widget>[
          Icon(Icons.photo_library, size: 30, color: Colors.white,),
          Icon(Icons.search, size: 30,color: Colors.white,),
          Icon(Icons.settings, size: 30,color: Colors.white,),
        ],
        onTap: (index) {
          pageController.jumpToPage(index);
        },
      ),
    );
  }

  void openDrawerHome(){
    scaffoldKey.currentState.openDrawer();
  }
}