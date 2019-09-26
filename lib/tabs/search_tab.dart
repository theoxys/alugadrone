import 'package:alugadrone_app/data/anuncio_data.dart';
import 'package:alugadrone_app/tiles/anuncio_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final filterTextController = TextEditingController();

      return DefaultTabController(
        length :1,
        child: Scaffold(
                //Tab(icon: Icon(Icons.grid_on, color: Colors.red),),
                //Tab(icon: Icon(Icons.list, color: Colors.red),)

          body: Column(
            children: <Widget>[
              SizedBox(height: 15.0,),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0
                ),
                child: TextFormField(
                  controller: filterTextController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    icon: Icon(Icons.search),

                    hintText: 'Pesquisar',),
                ),
              ),
              Expanded(
                child: FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance.collection("anuncio").getDocuments(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData)
                      return Center(child:CircularProgressIndicator(),);
                    else
                      return TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          /*GridView.builder(
                      padding: EdgeInsets.all(4.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                            childAspectRatio: 0.65
                        ),
                        itemCount: snapshot.data.documents.length,

                        itemBuilder: (context, index){
                            return AnuncioTile("grid", AnuncioData.fromDocument(snapshot.data.documents[index]));
                        }),*/
                          ListView.builder(
                              padding: EdgeInsets.all(4.0),
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index){
                                return AnuncioTile("list", AnuncioData.fromDocument(snapshot.data.documents[index]));
                              }
                          )
                        ],
                      );
                  },
                ),

              ),

            ],
          ),

        ),

      );


  }
}
