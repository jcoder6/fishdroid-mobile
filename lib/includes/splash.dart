import 'package:fishdroid/pages/trivia.dart';
import 'package:flutter/material.dart';
// import '../pages/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Trivia(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xffffffff), Color(0xff0c82df)],
          stops: [0, 1],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 200,
                    width: 220,
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'images/fishdroid-logo.png',
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                    child: const Text(
                      'Fishdroid 2.0',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 0, 56, 160),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, 170.0, 0.0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                        'images/logobfar.png',
                        height: 45,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                  Text(
                    'Powered by BFAR',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 56, 160)),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
