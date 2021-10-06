import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../core/src/model/cocktail_definition.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static final String table = 'Favorite_cocktails';

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    try {
      _database = await initDB();
      return _database;
    } catch (ex) {
      print(ex);
    }
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "favorites_cocktails.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE ' +
          table +
          ' (id TEXT PRIMARY KEY NOT NULL, name TEXT, drinkThumbUrl TEXT, isFavourite TEXT)');
    });
  }

  Map<String, dynamic> cocktailToMap(CocktailDefinition cocktail) {
    return {
      'id': cocktail.id,
      'name': cocktail.name,
      'drinkThumbUrl': cocktail.drinkThumbUrl,
      'isFavourite': cocktail.isFavourite.toString()
    };
  }

  Future<List<CocktailDefinition>> queryAllFavoritesCocktails() async {
    // Get a reference to the database.
    final db = await database;
    // Query the table for all favorite cocktails.
    final List<Map<String, dynamic>> maps = await db!.query(table);
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return CocktailDefinition(
          id: maps[i]['id'].toString(),
          name: maps[i]['name'],
          drinkThumbUrl: maps[i]['drinkThumbUrl'],
          isFavourite: true);
    });
  }

  Future<int> favoriteCocktailsListCount() async {
    return (await queryAllFavoritesCocktails()).length;
  }

  Future<void> insertFavoriteCocktail(CocktailDefinition cocktail) async {
    final db = await database;
    await db?.insert(
      table,
      cocktailToMap(cocktail),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteFavoriteCocktail(CocktailDefinition cocktail) async {
    final db = await database;
    await db?.delete(table, where: 'id = ?', whereArgs: [cocktail.id]);
  }
}
