import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lesson_21_animations_homework/stores/db_store.dart';
import 'package:provider/provider.dart';
import '../../core/models.dart';

import 'package:lesson_21_animations_homework/stores/favoritecocktail_store.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_scaffold.dart';
import 'package:lesson_21_animations_homework/ui/pages/categories_fitler_bar_delegate.dart';
import 'package:lesson_21_animations_homework/ui/pages/cocktail_grid_item.dart';
import 'package:lesson_21_animations_homework/main.dart';

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
class FavouriteCocktailsPage extends StatefulWidget {
  //final CocktailCategory selectedCategory;
  const FavouriteCocktailsPage({Key? key /*, this.selectedCategory*/})
      : super(key: key);

  @override
  _FavouriteCocktailsPageState createState() =>
      _FavouriteCocktailsPageState(/*selectedCategory*/);
}

class _FavouriteCocktailsPageState extends State<FavouriteCocktailsPage> {
  // final CocktailCategory selectedCategory;
  // final ValueNotifier<CocktailCategory> _categoryNotifier;

//  _FavouriteCocktailsPageState(/*this.selectedCategory*/)
  //     : _categoryNotifier = ValueNotifier<CocktailCategory>(/*selectedCategory*/);
  // final store = FavoriteCocktailStore();
  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
        title: 'Избранное',
        currentSelectedNavBarItem: 2,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 21)),
            // SliverPersistentHeader(
            //   delegate: CategoriesFilterBarDelegate(
            //     CocktailCategory.values,
            //     onCategorySelected: (category) {
            //       _categoryNotifier.value = category;
            //     },
            //     selectedCategory: _categoryNotifier.value,
            //   ),
            //   floating: true,
            // ),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            _buildCocktailItems(context)
          ],
        ));
  }

  Widget _buildCocktailItems(BuildContext context) {
    return Observer(builder: (context) {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((ctx, index) {
            return CocktailGridItem(
              (Provider.of<FavoriteCocktailStore>(context)
                          .cocktailFavoritesList ??
                      Provider.of<FavoriteCocktailStore>(context)
                          .cocktailFavoritesListFuture)!
                  .elementAt(index),
              selectedCategory: CocktailCategory.cocktail,
            );
          },
              childCount: (Provider.of<FavoriteCocktailStore>(context)
                          .cocktailFavoritesList ??
                      Provider.of<FavoriteCocktailStore>(context)
                          .cocktailFavoritesListFuture)!
                  .length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: CocktailGridItem.aspectRatio,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            crossAxisCount: 2,
          ),
        ),
      );
    });

    // return SliverFillRemaining(
    //   child: Center(
    //     child: const CircularProgressIndicator(),
    //   ),
    // );
  }
}
