import 'package:flutter/material.dart';

import 'package:movie/src/providers/peliculas_providers.dart';
import 'package:movie/src/widgets/card_swiper_widget.dart';
import 'package:movie/src/widgets/movie_horizontal.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final peliculasProvider=new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIENVENIDO'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTarjeta(),
          _footer(context)
        ],
      ),
    );
  }

  Widget _buildTarjeta(){
 
    return FutureBuilder(
      future: peliculasProvider.getEnCines() ,
      builder:(BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return CardSwiper(
            peliculas:snapshot.data
          );
        }else{
          return Container(
            height: 100.0,
            child: Center(child: CircularProgressIndicator(),),
          );
        } 
      },
    );
  }

  Widget _footer (BuildContext context){
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('Populares'),
          FutureBuilder(
          future: peliculasProvider.getPopular(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return MovieHorizontal(peliculas: snapshot.data);
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      ],
      )
    );
  }

}