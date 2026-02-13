import 'package:flutter/material.dart';
import 'package:game/game/game_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Fruit Catcher Game',
     home:GameScreen(),
     debugShowCheckedModeBanner: false,
     );
  }
}
