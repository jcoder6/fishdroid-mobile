import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //Logo Container
              width: 120,
              height: 120,
              margin: const EdgeInsets.only(right: 10),
              // color: Colors.blueAccent,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                  image: AssetImage('images/fishdroid-logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              //Title Container
              transform: Matrix4.translationValues(-3, -20, 0),
              child: const Text(
                'Message us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff154670),
                ),
              ),
            ),
            SizedBox(
              //Input Email Container
              width: MediaQuery.of(context).size.width - 50,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
            ),
            Container(
              //Message Container
              transform: Matrix4.translationValues(0, -20, 0),
              width: MediaQuery.of(context).size.width - 50,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  maxLines: null,
                  minLines: 10,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Define the action to be performed when the button is pressed
                // For example, you can submit the message or perform any other action here
                print('submit yern?');
              },
              child: Text('Submit'),
            ),
            Container(
                //Submit Button Container

                ),
          ],
        ),
      ),
    );
  }
}
