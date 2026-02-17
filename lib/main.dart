import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/game/fruit_catcher_game.dart';
import 'package:game/game/managers/audio_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AudioManager().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Game',
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // final ValueNotifier<int> counter = ValueNotifier(0);
  late FruitCatcherGame game;

  @override
  void initState() {
    super.initState();
    game = FruitCatcherGame();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      body: Stack(
        children: [
          GameWidget(game: game),
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius : BorderRadius.circular(10)
              ),
              child: ValueListenableBuilder<int>(
                valueListenable: game.scoreNotifier,
                builder: (context, score, child) {
                  return Text(
                    'Score: $score',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  );
                },
              )
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.music_note,
                    color: Colors.white,
                    ),
                  onPressed: () {}, 
                ),
                IconButton(
                  icon: Icon(
                    Icons.volume_up,
                    color: Colors.white,
                    ),
                  onPressed: () {}, 
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
