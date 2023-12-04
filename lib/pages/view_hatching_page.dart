import 'package:fishdroid/data/hatch_video_data.dart';
import 'package:fishdroid/data/hatchery.dart';
import 'package:fishdroid/includes/home_app_bar.dart';
import 'package:fishdroid/includes/home_drawer.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewHatcingPage extends StatefulWidget {
  final int fishID;
  const ViewHatcingPage(this.fishID, {Key? key}) : super(key: key);

  @override
  State<ViewHatcingPage> createState() => _ViewHatcingPageState();
}

class _ViewHatcingPageState extends State<ViewHatcingPage> {
  List<HatcheryData>? hatchItem;
  List<HatchVideoData>? hatchVideos;
  var isLoaded = false;
  var isVideo = false;

  @override
  void initState() {
    super.initState();
    getOneHatch();
    getHatchVideos();
  }

  getOneHatch() async {
    hatchItem = await RemoteService().getOneHatchery(widget.fishID);
    if (hatchItem != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getHatchVideos() async {
    hatchVideos = await RemoteService().hatchVideos(widget.fishID);
    print(hatchVideos!.length);
    if (hatchVideos != null) {
      setState(() {
        isVideo = true;
      });
    }
  }

    var url = 'https://www.youtube.com/watch?v=8idjfS1Wg10&t=242s';
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: false, // Set to true to force opening in a WebView
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Scaffold(
            appBar: HomeAppBar(),
            endDrawer: const HomeDrawer(),
            body: Center(
              child: Column(
                children: [
                  // Add a title widget here
                  const SizedBox(height: 20),
                  Text(
                    '${hatchItem![0].fishName} Hatching Video Phase',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff154670),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    flex: 1,
                    child: isVideo
                        ? ListView.builder(
                            itemCount: hatchVideos!.length,
                            itemBuilder: (context, index) {
                              final hatchVideo = hatchVideos![index];
                              return Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 50,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Phase: ${hatchVideo.phaseNum}"),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      ElevatedButton(
                                        onPressed: () => launchURL(hatchVideo.videoLink),
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: const Row(
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.play,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Watch Phase on youtube'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                  // Add information below the list here

                  const SizedBox(height: 20),
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: MediaQuery.of(context).size.height,
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffC5D7F0),
                        borderRadius: BorderRadius.circular(10),
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                '${hatchItem![0].fishName} Hatching Proces',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff154670),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              hatchItem![0].hatchProcess +
                                  hatchItem![0].hatchProcess,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 16,
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
