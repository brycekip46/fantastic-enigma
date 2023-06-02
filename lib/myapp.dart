import 'appstate.dart';
import 'myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
