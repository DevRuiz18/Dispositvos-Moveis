import 'package:book_tickets/models/movies.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class MoviesRepository extends ChangeNotifier{
  late Database db;
  List<Movies> _movies = [];

  List<Movies> get movies => _movies;

  MoviesRepository(){
    _initRepository();
  }

  _initRepository() async {
    await _getMovies();
  }
  _getMovies() async{
     _movies = [];
    List operacoes = await db.query('movie');
    notifyListeners();
  }
}