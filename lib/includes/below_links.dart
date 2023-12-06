import 'package:fishdroid/includes/colors.dart';
import 'package:fishdroid/pages/game/game.dart';
import 'package:fishdroid/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BelowLinks extends StatelessWidget {
  const BelowLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        transform: Matrix4.translationValues(0, -100, 0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore',
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 235, 235, 235),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(pageIndex: 7),
                      ),
                    );
                  },
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorsColors.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 107, 107, 107)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(2, 2), // Adjust the values as needed
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(
                        top: 25,
                        bottom: 25,
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: FaIcon(
                              FontAwesomeIcons.filePen,
                              size: 50,
                              color: Color(0xff154670),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Term',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff154670),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => const Game(),
                      ),
                    );
                  },
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorsColors.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 107, 107, 107)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(2, 2), // Adjust the values as needed
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(
                        top: 25,
                        bottom: 25,
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: FaIcon(
                              FontAwesomeIcons.gamepad,
                              size: 50,
                              color: Color(0xff154670),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Games',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff154670),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
