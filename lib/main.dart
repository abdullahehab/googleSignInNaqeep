import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppState/appState.dart';
import 'GoogleMap.dart';
import 'Test.dart';
import 'googleLogin.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: AppState(),
      )],
    child: MyApp(),
//    child: GoogleSignIN(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MapDemp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: Menu(),
      home: MapWidget(),
    );
  }
}