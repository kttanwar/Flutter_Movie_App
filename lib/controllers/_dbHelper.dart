import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/movie.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'movies.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE movies(
          id INTEGER PRIMARY KEY,
          name TEXT,
          director TEXT,
          poster TEXT
      )
      ''');
  }

  Future<List<Movie>> getMovies() async {
    Database db = await instance.database;
    var movies = await db.query('movies', orderBy: 'name');
    List<Movie> movieList =
        movies.isNotEmpty ? movies.map((c) => Movie.fromMap(c)).toList() : [];
    return movieList;
  }

  Future<int> add(Movie movie) async {
    Database db = await instance.database;
    return await db.insert('movies', movie.toMap());
  }

  Future<int> remove(int? id) async {
    Database db = await instance.database;
    return await db.delete('movies', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Movie movie) async {
    Database db = await instance.database;
    return await db.update('movies', movie.toMap(),
        where: "id = ?", whereArgs: [movie.id]);
  }
}
