import 'dart:async';

import '../core/models.dart';
import 'dart:core';
import './db_store.dart';

import 'package:mobx/mobx.dart';

part 'favoritecocktail_store.g.dart';

class FavoriteCocktailStore = _FavoriteCocktailStoreBase
    with _$FavoriteCocktailStore;

abstract class _FavoriteCocktailStoreBase with Store {
  _FavoriteCocktailStoreBase();

////////////////////////////////////////////////////////

  final favoritesCocktailsListObservable =
      Observable<List<CocktailDefinition>?>(null);

  static var favoritesCocktailsListObservableFuture =
      ObservableFuture<List<CocktailDefinition>>(
          DBProvider.db.queryAllFavoritesCocktails());

//////////////////////////////////////////////////////

  @computed
  List<CocktailDefinition>? get cocktailFavoritesList {
    return favoritesCocktailsListObservable.value;
  }

  @computed
  List<CocktailDefinition>? get cocktailFavoritesListFuture {
    return favoritesCocktailsListObservableFuture.value;
  }

//////////////////////////////////////////////////////

  @action
  Future<dynamic> insertCocktailToFavorites(CocktailDefinition cocktail) async {
    await DBProvider.db.insertFavoriteCocktail(cocktail);

    favoritesCocktailsListObservable.value =
        await DBProvider.db.queryAllFavoritesCocktails();
  }

  @action
  Future<dynamic> deleteCocktailFromFavorites(
      CocktailDefinition cocktail) async {
    await DBProvider.db.deleteFavoriteCocktail(cocktail);
    favoritesCocktailsListObservable.value =
        await DBProvider.db.queryAllFavoritesCocktails();
  }

  @action
  Future<dynamic> getFavoritesCocktails() async {
    favoritesCocktailsListObservable.value =
        await DBProvider.db.queryAllFavoritesCocktails();
  }
  /////////////////////////////////////////////////////////////////////////

  @action
  Future<dynamic> insertCocktailToFavoritesFuture(
      CocktailDefinition cocktail) async {
    await DBProvider.db.insertFavoriteCocktail(cocktail);

    favoritesCocktailsListObservableFuture =
        DBProvider.db.queryAllFavoritesCocktails().asObservable();
  }

  @action
  Future<dynamic> deleteCocktailFromFavoritesFuture(
      CocktailDefinition cocktail) async {
    await DBProvider.db.deleteFavoriteCocktail(cocktail);

    favoritesCocktailsListObservableFuture =
        DBProvider.db.queryAllFavoritesCocktails().asObservable();
  }

  @action
  Future<dynamic> getFavoritesCocktailsFuture() async {
    favoritesCocktailsListObservableFuture =
        DBProvider.db.queryAllFavoritesCocktails().asObservable();
  }
}
