import 'package:flame_audio/flame_audio.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();

  bool _isMusicEnabled = true;
  bool _isSfxEnabled = true;
  double _musicVolume = 0.7;
  double _sfxVolume = 1.0;

  bool get isMusicEnabled => _isMusicEnabled;
  bool get isSfxEnabled => _isSfxEnabled;
  double get musicVolume => _musicVolume;
  double get sfxVolume => _sfxVolume;

  Future<void> initialize() async {
    try {
      await FlameAudio.audioCache.loadAll([
        'music/arcade_melody.mp3',
        'sfx/wolfy_sanic-collect-ring-15982.mp3',
      ]);
      print('Audio Initialize Successfully');
    } catch (e) {
        print('Error initializing audio: $e');
      }
  }

  void playBackgroundMusic() {
    if (_isMusicEnabled) {
      try {
        FlameAudio.bgm.play('music/arcade_melody.mp3', volume: _musicVolume);
      } catch (e) {
        print('Error playing backsound: $e');
      }
    }
  }

  void pauseBackgroundMusic() {
    try {
      FlameAudio.bgm.pause();
    } catch (e) {
      print('Error when pausing music: $e');
    }
  }

  void resumeBackgroundMusic() {
    try {
      FlameAudio.bgm.resume();
    } catch (e) {
      print('Error resuming music: $e');
    }
  }

  void playSfx(String fileName){
    if (_isSfxEnabled) {
      try {
        FlameAudio.play('sfx/$fileName', volume: _sfxVolume);
      } catch (e) {
        print('Error playing sfx: $e');
      }
    }
  }

  void playSfxWithVolume(String fileName, double volume) {
    if (_isSfxEnabled) {
      try {
        final adjustedVolume = (volume * _sfxVolume).clamp(0.0, 1.0);
      } catch (e) {
        print('Error customing volume sound effect: $e');
      }
    }
  }

}
