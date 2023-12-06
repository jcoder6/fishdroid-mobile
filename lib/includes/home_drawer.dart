import 'package:fishdroid/includes/colors.dart';
import 'package:fishdroid/pages/game/game.dart';
import 'package:fishdroid/pages/home.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: ColorsColors.primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                border: Border(
                  bottom: Divider.createBorderSide(
                    context,
                    color: const Color(0xff154670),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'images/fishdroid-logo.png',
                    height: 100,
                    width: 100,
                  ),
                  const Text(
                    'Fishdroid 2.0',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xff154670),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // ListTile(
            //   title:const Center(
            //     child: Text(
            //       'Search',
            //       style: TextStyle(
            //           color: Color(0xff154670),
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold),
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const MyHomePage(
            //                 pageIndex: 9)
            //                 )
            //                 );
            //   },
            // ),
            ListTile(
              title:const Center(
                child: Text(
                  'Fish',
                  style: TextStyle(
                      color: Color(0xff154670),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(
                            pageIndex: 1)
                            )
                            );
              },
            ),
            ListTile(
              title: const Center(
                child: Text(
                  'Games',
                  style: TextStyle(
                      color: Color(0xff154670),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Game()
                            )
                            );
              },
            ),
            ListTile(
              title: const Center(
                child: Text(
                  'Recipe',
                  style: TextStyle(
                      color: Color(0xff154670),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(
                            pageIndex: 3)
                            )
                            );
              },
            ),
            
            ListTile(
              title: const Center(
                child: Text(
                  'Terminologies',
                  style: TextStyle(
                      color: Color(0xff154670),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(
                            pageIndex: 7)
                            )
                            );
              },
            ),
            ListTile(
              title: const Center(
                child: Text(
                  'Hatchery',
                  style: TextStyle(
                      color: Color(0xff154670),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(
                            pageIndex: 4)
                            )
                            );
              },
            ),
            ListTile(
              title: const Center(
                child: Text(
                  'Message Us',
                  style: TextStyle(
                      color: Color(0xff154670),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(
                            pageIndex: 8)
                            )
                            );
              },
            ),
          ],
        ),
      ),
    );
  }
}
