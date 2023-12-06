import 'package:fishdroid/pages/app_home.dart';
import 'package:fishdroid/pages/camera_page.dart';
import 'package:fishdroid/pages/fish_Page.dart';
import 'package:fishdroid/pages/game/game.dart';
import 'package:fishdroid/pages/hatcheries.dart';
import 'package:fishdroid/pages/message.dart';
import 'package:fishdroid/pages/recipes.dart';
import 'package:fishdroid/pages/search_page.dart';
import 'package:fishdroid/pages/terminology.dart';
import 'package:flutter/material.dart';
import '../includes/home_app_bar.dart';
import '../includes/home_bottom_nav.dart';
import '../includes/home_drawer.dart';

class MyHomePage extends StatefulWidget {
  final int pageIndex;
  const MyHomePage({Key? key, required this.pageIndex}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_field
  int _currentIndex = 0;

  // ignore: unused_element
  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = (widget.pageIndex < 5) ?  widget.pageIndex : 0;
    });

  }


  final tabs = [
    const AppHome(),
    const FishPages(),
    const CameraPage(),
    const Recipes(),
    const Hatcheries(),
    const Center(child: Text('Fish Trivia')),
    const Game(),
    const Termniology(),
    const MessagePage(),
    const SearchPage(""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: HomeAppBar(),
      endDrawer: const HomeDrawer(),
      body: tabs[widget.pageIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: (widget.pageIndex < 5) ?  widget.pageIndex : 0,
      ),
    );
  }
}