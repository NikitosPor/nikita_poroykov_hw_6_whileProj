import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:provider/provider.dart';
import 'package:lesson_21_animations_homework/stores/favoritecocktail_store.dart';

///
/// TODO:
///        - Склонировать соотвествующий github репозиторий с заготовкой проекта для этого урока (для соот-щего подхода к управлению состоянием приложения - redux, bloc mobx версии) (https://github.com/guid-empty/otus-cocktail-app-lessons)
///        - Внести изменения в классы описания состояний для экрана FavouriteCocktailsPage (будут помечены /// todo)
///        - Открыть класс экрана FavouriteCocktailsPage
///        - Внести изменения в код экрана, выделив логику для получения состояния используя один из ранее рассмотренных подходов к state management
///        - Внести изменения в экран CocktailDetailPage (CocktailTitle) для управления состояния isFavourite текущей модели (коктейль должен появиться или удалиться в списке избранного в соот-щем блоке состояния приложения)
///        - Убедиться, что изменения состояния isFavourite для конкретного коктейля отражается в поведении экрана FavouriteCocktailsPage (появляется новый избранный коктейль, удаляется ранее убранный из favourites)
///
/// На усмотрение студента:
///        - Можно выполнить любую декомпозицию класса FavouriteCocktailsPage для внесения изменений в управление состоянием (рефакторинг)
///        - Можно выполнить любую декомпозицию класса CocktailDetailPage (CocktailTitle) для внесения изменений в управление состоянием (рефакторинг)
///        - Можно выполнить любую декомпозицию в самих классах управления состоянием приложения (store, block etc)
///        - Можно выполнить рефакторинг кнопки isFavourite, выделив ее в отдельный виджет и используя на обоих экранах
/// Мокап экрана Избранное (FavouriteCocktailsPage):
/// https://www.figma.com/file/UKHKopXpDy02I232c9mdwZ/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8?node-id=24%3A441
///
/// В этом экране используется точно такая же  верстка, как и на экране фильтрации (то есть можно переиспользовать экран выдачи результатов по категориям)
///

class CocktailTitle extends StatefulWidget {
  final Cocktail cocktail;
  late CocktailDefinition cocktailDefinition;
  final bool isFavorite;

  CocktailTitle({required this.cocktail, required this.isFavorite});

  @override
  State<CocktailTitle> createState() => _CocktailTitleState();
}

class _CocktailTitleState extends State<CocktailTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.cocktail.name!,
          style: Theme.of(context).textTheme.headline3,
        ),
        Observer(builder: (context) {
          return _getIsFavoriteIcon();
        })
      ],
    );
  }

  Widget _getIsFavoriteIcon() {
    final cocktailDefinition = CocktailDefinition(
        id: widget.cocktail.id,
        name: widget.cocktail.name,
        drinkThumbUrl: widget.cocktail.drinkThumbUrl,
        isFavourite: widget.cocktail.isFavourite);

    if (widget.isFavorite) {
      return IconButton(
        icon: Icon(Icons.favorite, color: Colors.white),
        onPressed: () async {
          await Provider.of<FavoriteCocktailStore>(context, listen: false)
              .deleteCocktailFromFavorites(cocktailDefinition);
          setState(() {
            print(
                'Список фаворитов = ${Provider.of<FavoriteCocktailStore>(context, listen: false).cocktailFavoritesList.toString()}');
          });
        },
      );
    } else {
      return IconButton(
        icon: Icon(Icons.favorite_border, color: Colors.white),
        onPressed: () async {
          await Provider.of<FavoriteCocktailStore>(context, listen: false)
              .insertCocktailToFavorites(cocktailDefinition);
          setState(() {
            print(
                'Список фаворитов = ${Provider.of<FavoriteCocktailStore>(context, listen: false).cocktailFavoritesList.toString()}');
          });
        },
      );
    }
  }
}

// class CocktailTitle extends StatefulWidget {
//   final String cocktailTitle;
//   final bool isFavorite;

//   CocktailTitle({required this.cocktailTitle, required this.isFavorite});

//   @override
//   State<CocktailTitle> createState() => _CocktailTitleState();
// }

// class _CocktailTitleState extends State<CocktailTitle> {
//   @override
//   Widget build(BuildContext context) {
//     return Observer(builder: (context) {
//       return Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             widget.cocktailTitle,
//             style: Theme.of(context).textTheme.headline3,
//           ),
//           _getIsFavoriteIcon(context)
//         ],
//       );
//     });
//   }

//   Widget _getIsFavoriteIcon(BuildContext context) {
//     if (widget.isFavorite) {
//       return IconButton(
//         icon: Icon(Icons.favorite, color: Colors.white),
//         onPressed: () async {
//           await Provider.of<FavoriteCocktailStore>(context, listen: false)
//               .deleteCocktailFromFavorites(widget.cocktailDefinition);
//           setState(() {
//             print(
//                 'Список фаворитов = ${Provider.of<FavoriteCocktailStore>(context, listen: false).cocktailFavoritesList.toString()}');
//           });
//         },
//       );
//     } else {
//       return IconButton(
//         icon: Icon(Icons.favorite_border, color: Colors.white),
//         onPressed: () {},
//       );
//     }
//   }
// }
