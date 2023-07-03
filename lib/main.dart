import 'package:flutter/material.dart';
import 'package:rollspel_app/screens/feats.dart';
import 'screens/spells.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyAppState extends ChangeNotifier {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Rollspel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
          ),
          useMaterial3: true,
        ),
        home: const DefaultTabController(
          length: 3,
          child: Scaffold(
            bottomNavigationBar: BottomAppBar(
              child: TabBar(tabs: [
                Tab(
                  icon: Icon(
                    Icons.menu_book,
                  ),
                  text: 'Spells',
                ),
                Tab(
                  icon: Icon(Icons.star_purple500),
                  text: 'Feats',
                ),
                Tab(
                  icon: Icon(Icons.person_outline_outlined),
                  text: 'Inventory',
                )
              ]),
            ),
            body: TabBarView(children: [
              Spells(title: 'Spells'),
              Feats(title: 'Feats'),
              Icon(Icons.map_outlined)
            ]),
          ),
        ),
      ),
    );

    //MyHomePage(title: 'Rollspelsapp')));
  }
}
