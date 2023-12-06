import 'package:fishdroid/includes/colors.dart';
import 'package:fishdroid/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int onTabSelected;

  const CustomBottomNavigationBar({Key? key, required this.onTabSelected})
      : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.onTabSelected,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsColors.primaryColor,
      // selectedItemColor: Colors.grey,
      // fixedColor: const Color.fromARGB(255, 33, 120, 197),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Color(0xff154670)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.fishFins, color: Color(0xff154670)),
          label: 'Fishes',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.camera, color: Color(0xff154670)),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon:
              FaIcon(FontAwesomeIcons.bowlFood, color: Color(0xff154670)),
          label: 'Recipe',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.egg, color: Color(0xff154670)),
          label: 'Hatchery',
        ),
      ],
      onTap: (index) {
        Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(pageIndex: index),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}
