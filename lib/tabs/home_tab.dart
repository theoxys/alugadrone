import 'package:alugadrone_app/screens/home_screen.dart';
import 'package:alugadrone_app/widgets/custom_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';


class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.grey,
          Colors.white
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        )
      ),
    );

    return FutureBuilder<QuerySnapshot>(
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
    );
  }
}



/*SliverAppBar(
              leading: FlatButton(child: Image.asset('img/menuIcon.png'), onPressed:()=> HomeScreen()),
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
            ),*/