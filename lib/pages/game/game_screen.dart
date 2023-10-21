// ignore_for_file: unused_import
import 'package:fishdroid/pages/game/answer/hidden_letters.dart';
import 'package:fishdroid/pages/game/const/const.dart';
import 'package:fishdroid/pages/game/game.dart';
import 'package:fishdroid/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

var word = "jomer".toUpperCase();

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  List<String> userGuess = [];
  List<String> selectedChar = [];
  var tries = 0;
  var tryLeft = 6;
  List<String> wordSplit = word.split('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Text("FishDroid: The Game"),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    (context),
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyHomePage(pageIndex: 0)));
                },
                icon: Icon(Icons.home),
              )
            ],
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      //tries indication
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Text(
                                tryLeft.toString(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:
                                    tryLeft <= 5 ? Colors.red : Colors.white38,
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:
                                    tryLeft <= 4 ? Colors.red : Colors.white38,
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:
                                    tryLeft <= 3 ? Colors.red : Colors.white38,
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:
                                    tryLeft <= 2 ? Colors.red : Colors.white38,
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:
                                    tryLeft <= 1 ? Colors.red : Colors.white38,
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:
                                    tryLeft <= 0 ? Colors.red : Colors.white38,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // image here
                      Expanded(
                        flex: 4,
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width - 150,
                            height: MediaQuery.sizeOf(context).height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: AssetImage('assets/goldfish.jpg'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            'What is the name of this fucking fish',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      // the hint
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: word
                          .split("")
                          .map((e) => hiddenLetter(
                              e, !selectedChar.contains(e.toUpperCase())))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 7,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: characters.split('').map((e) {
                  return ElevatedButton(
                    onPressed: selectedChar.contains(e.toUpperCase())
                        ? null
                        : () {
                            setState(() {
                              selectedChar.add(e.toUpperCase());
                              if (!word.split("").contains(e.toUpperCase())) {
                                tryLeft--;
                              } else {
                                userGuess.add(e.toUpperCase());
                                userGuess.sort();
                                wordSplit.sort();
                                if (listEquals(userGuess, wordSplit)) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return _buildPopupDialog(
                                          context,
                                          'Continue?',
                                          "You've got the correct answer! \nWould you like to continue?");
                                    },
                                  );
                                }
                              }
                              if (tryLeft < 1) {
                                showDialog(
                                  context: context,
                                  builder: (context) => _buildPopupDialog(
                                      context,
                                      'Try Again?',
                                      "Seems like you've guessed enough"),
                                );
                              }

                              // if(tryLeft == 0 ) Navigator.push((context), MaterialPageRoute(builder: (context) => const Game()));
                            });
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                    ),
                    child: Text(
                      e,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildPopupDialog(
    BuildContext context, String title, String dialogContent) {
  return AlertDialog(
    title: Text(
      title,
      style: TextStyle(color: title == 'Continue?' ? Colors.green : Colors.red),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(dialogContent),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.push(
              (context),
              MaterialPageRoute(
                  builder: (context) =>
                      const MyHomePage(pageIndex: 0))); // Close the dialog
        },
        style: TextButton.styleFrom(
          primary: Colors.red, // Set the text color to red
        ),
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
              (context),
              MaterialPageRoute(
                  builder: (context) => const Game())); // Close the dialog
        },
        style: TextButton.styleFrom(
          primary: Colors.green, // Set the text color to red
        ),
        child: const Text('Continue'),
      ),
    ],
  );
}
