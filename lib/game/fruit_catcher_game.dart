import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:game/game/components/basket.dart';
import 'package:game/game/managers/audio_manager.dart';

class FruitCatcherGame extends FlameGame {
  late Basket basket;
  late TextComponent scoreText;
  final Random random = Random();
  double fruitSpawnTimer = 0 ;
  final double fruitSpawnInterval = 1.5 ;


  @override
  Color backgroundColor() => const Color(0xFF000000);


  final ValueNotifier<int> scoreNotifier = ValueNotifier<int>(0);
  int _score = 0;

  int get score => _score;
  set score(int value){
    _score = value;
    scoreNotifier.value = value;  
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    AudioManager().playBackgroundMusic();
  }
}

