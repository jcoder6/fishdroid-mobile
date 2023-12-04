import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textMessageController = TextEditingController();

  sendMessage(email, message) async {
    print(email);
    print(message);
  }

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: textEmailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                  ),
                ),
              ),
            ),
            Container(
              //Message Container
              transform: Matrix4.translationValues(0, -20, 0),
              width: MediaQuery.of(context).size.width - 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: textMessageController,
                  maxLines: null,
                  minLines: 10,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    hintText: 'Enter your concern',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Define the action to be performed when the button is pressed
                // For example, you can submit the message or perform any other action here
                sendMessage(textEmailController.text, textMessageController.text);
              },
              child: const Text('Submit'),
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
