import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.grey,
          Colors.white
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
        )
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading:
        new FlatButton(key:null, onPressed:() => _scaffoldKey.currentState.openDrawer(),
            child:
            new Image.asset('img/menuIcon.png')
        ),
        title: const Text('AlugaDrone'),
        centerTitle: true,
      ),
    );
  }
}
