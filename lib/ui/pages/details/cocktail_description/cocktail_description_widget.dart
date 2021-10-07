import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lesson_21_animations_homework/core/src/model/cocktail.dart';
import 'package:lesson_21_animations_homework/stores/favoritecocktail_store.dart';
import 'package:lesson_21_animations_homework/ui/style/custom_colors.dart';
import 'package:provider/provider.dart';

import 'cocktail_characteristic_text.dart';
import 'cocktail_title.dart';

class CocktailDescriptionWidget extends StatelessWidget {
  final Cocktail cocktail;
  final List<String?> cocktailsNames = [];

  CocktailDescriptionWidget({required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.ingredients,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(builder: (context) {
              var list = (Provider.of<FavoriteCocktailStore>(context)
                      .cocktailFavoritesList ??
                  Provider.of<FavoriteCocktailStore>(context)
                      .cocktailFavoritesListFuture);
              return CocktailTitle(
                  cocktail: cocktail,
                  isFavorite: list!.any((element) =>
                      element.name == cocktail.name) //cocktail.isFavourite!,
                  );
            }),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'id:${cocktail.id}',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            CocktailCharacteristicText(
              characteristicName: 'Категория коктейля',
              characteristicValue: cocktail.category!.value,
            ),
            CocktailCharacteristicText(
              characteristicName: 'Тип коктейля',
              characteristicValue: cocktail.cocktailType!.value,
            ),
            CocktailCharacteristicText(
              characteristicName: 'Тип стекла',
              characteristicValue: cocktail.glassType!.value,
            ),
          ],
        ),
      ),
    );
  }
}
