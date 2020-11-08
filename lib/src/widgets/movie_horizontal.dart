import 'package:flutter/material.dart';
import 'package:movie/src/models/pelicula_model.dart';


class MovieHorizontal extends StatelessWidget {
  
  final List<Pelicula> peliculas;

  MovieHorizontal({
    @required
    this.peliculas
  });
  @override
  Widget build(BuildContext context) {
    final _scrennSize=MediaQuery.of(context).size;
    return Container(
      height: _scrennSize.height*0.23,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3
        ),
        children: _tarjeta()
      ),
    );
  }

  List<Container> _tarjeta(){
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 20),
        child: ClipRRect(
          child: FadeInImage(
            image: NetworkImage(pelicula.getPoster()),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(10.0),
        )
      );
    }).toList();
  }
}