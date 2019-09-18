import 'package:alugadrone_app/tabs/home_tab.dart';
import 'package:alugadrone_app/tabs/produto_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomeTab(),
        ProdutoTab(),
        Container(color: Colors.blue,),
        Container(color: Colors.yellowAccent,),
      ],
    );
  }
}
