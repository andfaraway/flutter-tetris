import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Sound extends StatefulWidget {
  final Widget child;

  const Sound({Key? key, required this.child}) : super(key: key);

  @override
  SoundState createState() => SoundState();

  static SoundState of(BuildContext context) {
    final state = context.findAncestorStateOfType<SoundState>();
    assert(state != null, 'can not find Sound widget');
    return state!;
  }
}

class SoundState extends State<Sound> {
  late AudioPlayer _player;

  bool mute = false;

  void _play(String name) {
    if (!mute) {
      _player.play(AssetSource('assets/audios/$name'));
    }
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void start() {
    _play('start.mp3');
  }

  void clear() {
    _play('clean.mp3');
  }

  void fall() {
    _play('drop.mp3');
  }

  void rotate() {
    _play('rotate.mp3');
  }

  void move() {
    _play('move.mp3');
  }
}
