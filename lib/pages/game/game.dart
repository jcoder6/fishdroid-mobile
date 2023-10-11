import 'package:fishdroid/pages/game/game_screen.dart';
import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const GameScreen(),
    );
  }
}
