// ignore_for_file: unused_import, avoid_print
import 'package:fishdroid/data/game_data.dart';
import 'package:fishdroid/pages/game/answer/hidden_letters.dart';
import 'package:fishdroid/pages/game/const/const.dart';
import 'package:fishdroid/pages/game/game.dart';
import 'package:fishdroid/pages/home.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz ".toUpperCase();
  var word = "";
  List<String> userGuess = [];
  List<String> selectedChar = [];
  var tries = 0;
  var tryLeft = 6;

  GameData? gameRandomData;
  var isLoaded = false;
  var defaultImageLink =
      "https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/default_img.PNG";
  var imgGameLink =
      "https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/quiz_images/";

  @override
  void initState() {
    super.initState();
    getGameRandomData();
  }

  getGameRandomData() async {
    gameRandomData = await RemoteService().gameRandomData();
    if (gameRandomData != null) {
      setState(() {
        word = gameRandomData!.quizAnswer.toUpperCase();
        isLoaded = true;
      });
      
      print(gameRandomData!.quizAnswer);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> wordSplit = word.split('');
    return !isLoaded
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.black87,
            appBar: AppBar(
              title: Container(
                padding: const EdgeInsets.all(1),
                child: Row(
                  children: [
                    const Text("FishDroid: The Game"),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyHomePage(pageIndex: 0)));
                      },
                      icon: const Icon(Icons.home),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
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
                                      color: tryLeft <= 5
                                          ? Colors.red
                                          : Colors.white38,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: tryLeft <= 4
                                          ? Colors.red
                                          : Colors.white38,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: tryLeft <= 3
                                          ? Colors.red
                                          : Colors.white38,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: tryLeft <= 2
                                          ? Colors.red
                                          : Colors.white38,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: tryLeft <= 1
                                          ? Colors.red
                                          : Colors.white38,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: tryLeft <= 0
                                          ? Colors.red
                                          : Colors.white38,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // image here
                            Expanded(
                              flex: 4,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width - 150,
                                  height: MediaQuery.sizeOf(context).height,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          gameRandomData!.quizImage !=
                                                  "NO_IMG_YET"
                                              ? imgGameLink +
                                                  gameRandomData!.quizImage
                                              : defaultImageLink,
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 30,
                                  padding: const EdgeInsets.all(1),
                                  child: Center(
                                    child: Text(
                                      gameRandomData!.quizHint,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
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
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: word
                                  .split("")
                                  .map((e) => hiddenLetter((e != ' ') ? e : '_',
                                      !selectedChar.contains(e.toUpperCase())))
                                  .toList(),
                            ),
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
                                    if (!word
                                        .split("")
                                        .contains(e.toUpperCase())) {
                                      tryLeft--;
                                    } else {
                                      userGuess.add(e.toUpperCase());
                                      userGuess.sort();
                                      
                                      var sortedWord = Set.from(wordSplit).toList()..sort();
                                      print(userGuess.join(''));
                                      print(sortedWord.join(''));
                                      // print(listEquals(sortedWord, userGuess));
                                      if (userGuess.join('') == sortedWord.join('')) {
                                      print('punyta');
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return _buildPopupDialog(
                                                context,
                                                'Continue?',
                                                "You've got the correct answer! \nWould you like to continue?");
                                          },
                                        );
                                      } else {
                                        print(false);
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
                            (e != ' ') ? e : '_',
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
          foregroundColor: Colors.red, // Set the text color to red
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
          foregroundColor: Colors.green, // Set the text color to red
        ),
        child: const Text('Continue'),
      ),
    ],
  );
}
