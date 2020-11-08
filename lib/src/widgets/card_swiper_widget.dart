import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie/src/models/pelicula_model.dart';


class CardSwiper extends StatelessWidget {


  final List<Pelicula> peliculas;

  CardSwiper({
    @required
    this.peliculas
  });

  @override
  Widget build(BuildContext context) {

    final _screenSize=MediaQuery.of(context).size;
      return Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width*0.6,
        itemHeight: _screenSize.height*0.4,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(peliculas[index].getPoster()),
              fit: BoxFit.fill,
            )
          );
        },
        itemCount: peliculas.length,
      );
  }
}