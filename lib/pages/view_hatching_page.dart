import 'package:fishdroid/includes/home_app_bar.dart';
import 'package:fishdroid/includes/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ViewHatcingPage extends StatefulWidget {
  final int fishID;
  const ViewHatcingPage(this.fishID, {Key? key}) : super(key: key);

  @override
  State<ViewHatcingPage> createState() => _ViewHatcingPageState();
}

class _ViewHatcingPageState extends State<ViewHatcingPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/HATCH_VIDEO_001.mp4')
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      endDrawer: const HomeDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayer(_controller),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xffC5D7F0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 107, 107, 107).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(2, 2), // Adjust the values as needed
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Bangus Hatching Process',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff154670),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "The hatchery process for milkfish, Chanos chanos, is a carefully orchestrated series of stages. It commences with the selection of mature, healthy broodstock possessing desirable genetic traits. These broodstock undergo conditioning to prepare them for spawning. The actual spawning involves the release of eggs by females and their external fertilization by males. Fertilized eggs are then collected and placed in controlled environments for incubation. After hatching, the larvae are nurtured in tanks with precise water conditions. This stage lasts until the eggs develop into viable larvae. This entire process demands vigilant monitoring of water quality, temperature, and feeding. It ensures the successful production of healthy milkfish for commercial purposes.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              },
            );
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          )),
    );
  }
}
