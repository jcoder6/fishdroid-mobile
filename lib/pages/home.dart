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
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final tabs = [
    const Home(),
    Center(child: new Text('Fishes')),
    Center(child: Text('Camare')),
    Center(child: Text('Recipes')),
    Center(child: Text('Fun Facts')),
    Center(child: Text('Quizzes')),
    Center(child: Text('Nutrinon')),
    Center(child: Text('Terminologies')),
    Center(child: Text('Hatchery'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),
        endDrawer: HomeDrawer(),
        body: tabs[widget.pageIndex],
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
