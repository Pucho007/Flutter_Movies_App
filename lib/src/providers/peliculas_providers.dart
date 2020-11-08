import 'dart:convert';

import 'package:movie/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider{

  String _apikey='4f026d05dacb01f825ec1855978fb181';
  String _url='api.themoviedb.org';
  String _languaje='es-ES';


  Future<List<Pelicula>> getEnCines() async{

    final url= Uri.https(_url, '3/movie/now_playing',{
        'api_key'  : _apikey,
        'language' :_languaje
    }); 

    final result=await http.get(url);

    final decodeData=json.decode(result.body);

    final peliculas=new Peliculas.fromJsonList(decodeData['results']);

 
    return peliculas.items;

  }

   Future<List<Pelicula>> getPopular() async{

    final url= Uri.https(_url, '3/movie/popular',{
        'api_key'  : _apikey,
        'language' :_languaje
    }); 

    final result=await http.get(url);

    final decodeData=json.decode(result.body);

    final peliculas=new Peliculas.fromJsonList(decodeData['results']);

 
    return peliculas.items;

  }


}