import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary, fontSize: 20);
    var appFav = context.watch<MyAppState>();
    if (appFav.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }
    return Scaffold(
      backgroundColor: theme.colorScheme.inversePrimary,
      body: SafeArea(
          child: ListView.builder(
        itemCount: appFav.favorites.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: theme.colorScheme.primary,
            elevation: 3,
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                size: 20,
              ),
              visualDensity: VisualDensity.comfortable,
              title: Text(
                appFav.favorites[index].asLowerCase,
                style: style,
              ),
            ),
          );
        },
      )),
    );
  }
}
