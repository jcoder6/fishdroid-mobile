import 'package:fishdroid/pages/home.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffC5D7F0),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                border: Border(
                  bottom: Divider.createBorderSide(
                    context,
                    color: Color(0xff154670),
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
                  Text(
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
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Center(
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
              title: Center(
                child: Text(
                  'Quiz',
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
                            pageIndex: 5)
                            )
                            );
              },
            ),
            ListTile(
              title: Center(
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
              title: Center(
                child: Text(
                  'Nutrition',
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
                            pageIndex: 6)
                            )
                            );
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Fun Facts',
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
              title: Center(
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
              title: Center(
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
