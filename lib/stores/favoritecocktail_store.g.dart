// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favoritecocktail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteCocktailStore on _FavoriteCocktailStoreBase, Store {
  Computed<List<CocktailDefinition>?>? _$cocktailFavoritesListComputed;

  @override
  List<CocktailDefinition>? get cocktailFavoritesList =>
      (_$cocktailFavoritesListComputed ??= Computed<List<CocktailDefinition>?>(
              () => super.cocktailFavoritesList,
              name: '_FavoriteCocktailStoreBase.cocktailFavoritesList'))
          .value;
  Computed<List<CocktailDefinition>?>? _$cocktailFavoritesListFutureComputed;

  @override
  List<CocktailDefinition>? get cocktailFavoritesListFuture =>
      (_$cocktailFavoritesListFutureComputed ??=
              Computed<List<CocktailDefinition>?>(
                  () => super.cocktailFavoritesListFuture,
                  name:
                      '_FavoriteCocktailStoreBase.cocktailFavoritesListFuture'))
          .value;

  final _$insertCocktailToFavoritesAsyncAction =
      AsyncAction('_FavoriteCocktailStoreBase.insertCocktailToFavorites');

  @override
  Future<dynamic> insertCocktailToFavorites(CocktailDefinition cocktail) {
    return _$insertCocktailToFavoritesAsyncAction
        .run(() => super.insertCocktailToFavorites(cocktail));
  }

  final _$deleteCocktailFromFavoritesAsyncAction =
      AsyncAction('_FavoriteCocktailStoreBase.deleteCocktailFromFavorites');

  @override
  Future<dynamic> deleteCocktailFromFavorites(CocktailDefinition cocktail) {
    return _$deleteCocktailFromFavoritesAsyncAction
        .run(() => super.deleteCocktailFromFavorites(cocktail));
  }

  final _$getFavoritesCocktailsAsyncAction =
      AsyncAction('_FavoriteCocktailStoreBase.getFavoritesCocktails');

  @override
  Future<dynamic> getFavoritesCocktails() {
    return _$getFavoritesCocktailsAsyncAction
        .run(() => super.getFavoritesCocktails());
  }

  final _$insertCocktailToFavoritesFutureAsyncAction =
      AsyncAction('_FavoriteCocktailStoreBase.insertCocktailToFavoritesFuture');

  @override
  Future<dynamic> insertCocktailToFavoritesFuture(CocktailDefinition cocktail) {
    return _$insertCocktailToFavoritesFutureAsyncAction
        .run(() => super.insertCocktailToFavoritesFuture(cocktail));
  }

  final _$deleteCocktailFromFavoritesFutureAsyncAction = AsyncAction(
      '_FavoriteCocktailStoreBase.deleteCocktailFromFavoritesFuture');

  @override
  Future<dynamic> deleteCocktailFromFavoritesFuture(
      CocktailDefinition cocktail) {
    return _$deleteCocktailFromFavoritesFutureAsyncAction
        .run(() => super.deleteCocktailFromFavoritesFuture(cocktail));
  }

  final _$getFavoritesCocktailsFutureAsyncAction =
      AsyncAction('_FavoriteCocktailStoreBase.getFavoritesCocktailsFuture');

  @override
  Future<dynamic> getFavoritesCocktailsFuture() {
    return _$getFavoritesCocktailsFutureAsyncAction
        .run(() => super.getFavoritesCocktailsFuture());
  }

  @override
  String toString() {
    return '''
cocktailFavoritesList: ${cocktailFavoritesList},
cocktailFavoritesListFuture: ${cocktailFavoritesListFuture}
    ''';
  }
}
