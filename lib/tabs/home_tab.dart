import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import '../screens/home_screen.dart';

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

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.red,
              elevation: 0.0,
              leading:
              new FlatButton(key:null, onPressed: ( ){Scaffold.of(context).openDrawer();},
                  child:
                  new Image.asset('img/menuIcon.png')
              ),
              flexibleSpace: FlexibleSpaceBar(
                  title: const Text("Feed",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  centerTitle: true
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance.collection("Feed images").orderBy("pos").getDocuments(),
              builder: (context, snapshot){
                if(!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                else
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    staggeredTiles: snapshot.data.documents.map((doc){
                      return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                    }
                    ).toList(),
                    children: snapshot.data.documents.map((doc){
                      return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: doc.data["image"],
                          fit: BoxFit.cover
                      );
                    }
                    ).toList(),
                  );
              },
            )
          ],
        )
      ],
    );
    /*return Scaffold(
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
    );*/
  }
}
