import 'package:flutter/material.dart';
import '../includes/home_app_bar.dart';
import '../includes/home_bottom_nav.dart';
import '../includes/home_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final tabs = [
    const Home(),
    Center(child: Text('Fishes')),
    Center(child: Text('Camare')),
    Center(child: Text('Recipes')),
    Center(child: Text('Fun Facts'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),
        endDrawer: HomeDrawer(),
        body: tabs[_currentIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          onTabSelected: _onTabSelected,
        ),
      );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home'));
  }
}
