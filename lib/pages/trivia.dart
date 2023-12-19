// import 'package:fishdroid/includes/home_app_bar.dart';
import 'package:fishdroid/data/trivia_data.dart';
import 'package:fishdroid/includes/colors.dart';
import 'package:fishdroid/pages/home.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:flutter/material.dart';

class Trivia extends StatefulWidget {
  const Trivia({super.key});

  @override
  State<Trivia> createState() => _TriviaState();
}

class _TriviaState extends State<Trivia> {
  TriviaData? trivia;
  var isLoaded = false;
  var showProgressIndicator = true;
  var imgTriviaLink =
      'https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/videos/trivia_videos/';
  @override
  void initState() {
    super.initState();
    getTrivia();

    if (!isLoaded) {
      Future.delayed(const Duration(seconds: 30), () {
        setState(() {
          showProgressIndicator = false;
        });
      });
    }
  }

  getTrivia() async {
    trivia = await RemoteService().getRandomTrivia();
    if (trivia != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (trivia == null) {
      return showProgressIndicator
          ? const Scaffold(
              backgroundColor: Color.fromARGB(255, 238, 238, 238),
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              ),
            )
          : Scaffold(
              backgroundColor: const Color.fromARGB(255, 238, 238, 238),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Can't Connect to the Server"),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(pageIndex: 2)));
                      },
                      child: const Text("Continue"),
                    ),
                  ],
                ),
              ),
            );
    } else {
      return Visibility(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/triviabg.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height - 100,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ColorsColors.primaryColor,
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
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Did you know:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff154670),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 220,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  imgTriviaLink + trivia!.triviaVideo),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 107, 107, 107)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(
                                  2, 2), // Adjust the values as needed
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        trivia!.trivia,
                        style: const TextStyle(
                          fontSize: 16,
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
                                builder: (builder) =>
                                    const MyHomePage(pageIndex: 0),
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
        ),
      );
    }
  }
}
