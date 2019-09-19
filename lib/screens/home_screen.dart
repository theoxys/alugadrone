import 'package:alugadrone_app/tabs/home_tab.dart';
import 'package:alugadrone_app/screens/search_screen.dart';
import 'package:alugadrone_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {


  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Scaffold(
            appBar: AppBar(

            ),
            body: HomeTab(),
            drawer: CustomDrawer(_pageController),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text("Buscar drone"),
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: SearchScreen(),
          ),
        ]
    );
  }

}

