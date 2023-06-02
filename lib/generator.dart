import 'appstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bigcard.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        BigCard(pair: pair),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                appState.toggleFavs();
              },
              icon: Icon(icon),
              label: Text("Like"),
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text("Generate Word"))
          ],
        )
      ]),
    );
  }
}
