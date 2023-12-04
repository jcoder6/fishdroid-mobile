import 'package:fishdroid/data/message.dart';
import 'package:fishdroid/pages/home.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textMessageController = TextEditingController();

  SendMessage? messageInstance;
  var isSent = false;
  var isLoading = false;

  sendMessage(email, message) async {
    var data = {
      'email': email,
      'message': message,
      'is_read': '0',
    };

    messageInstance = await RemoteService().sendMessage(data);

    if (message != null) {
      print('message sent');
      setState(() {
        isSent = true;
      });
    }
  }

  @override
  void dispose() {
    textEmailController.dispose();
    textMessageController.dispose();
    super.dispose();
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                await sendMessage(
                    textEmailController.text, textMessageController.text);

                setState(() {
                  isLoading = false;
                });

                // ignore: use_build_context_synchronously
                showDialog(context: (context), builder: _messageDiaglog);
              },
              child: !isLoading
                  ? const Text('Submit')
                  : const SizedBox(
                      width: 16.0, // set your desired width
                      height: 16.0, // set your desired height
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
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

Widget _messageDiaglog(BuildContext context) {
  return AlertDialog(
    title: const Center(
      child: Text('Message was sent!'),
    ),
    icon: const Center(
      child:
          FaIcon(FontAwesomeIcons.circleCheck, size: 50, color: Colors.green),
    ),
    content: SizedBox(
      height: 30,
      child: Center(
        child: ElevatedButton(
        onPressed: () {
          Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(
                            pageIndex: 0)
                            )
                            );
        },
        child: const Text("OK"),
      ),
      ),
    )
  );
}
