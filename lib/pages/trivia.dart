// import 'package:fishdroid/includes/home_app_bar.dart';
import 'package:fishdroid/pages/home.dart';
import 'package:flutter/material.dart';

class Trivia extends StatelessWidget {
  const Trivia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/triviabg.jpg'), fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height - 200,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xffC5D7F0),
                borderRadius: BorderRadius.circular(15),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Trivia of the Day',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff154670),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Did you know:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff154670),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/goldfish.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 107, 107, 107)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset:
                              const Offset(2, 2), // Adjust the values as needed
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Goldfish have a memory span that lasts for months, not just a few seconds. They can even recognize their owners and learn simple tricks.',
                    style: TextStyle(
                      fontSize: 18,
                      height: 2,
                      color: Color(0xff154670),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => MyHomePage(pageIndex: 0),
                          ),
                        );
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: const Text('Got it'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
