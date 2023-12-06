import 'package:camera/camera.dart';
import 'package:fishdroid/includes/colors.dart';
import 'package:fishdroid/main.dart';
import 'package:fishdroid/pages/search_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool isWorking = false;
  String result = '';
  CameraController? cameraController;
  CameraImage? imgCamera;
  var arrResult = [];

  initCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.max);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }

      setState(() {
        cameraController!.startImageStream((imageFromStream) => {
              if (!isWorking)
                {
                  isWorking = true,
                  imgCamera = imageFromStream,
                  runModelOnStreamFrames(),
                }
            });
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/fish_model/model_unquant.tflite",
      labels: "assets/fish_model/labels.txt",
    );
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  runModelOnStreamFrames() async {
    if (imgCamera != null) {
      var recognitions = await Tflite.runModelOnFrame(
        bytesList: imgCamera!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: imgCamera!.height,
        imageWidth: imgCamera!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 1,
        threshold: 0.1,
        asynch: true,
      );
      result = '';

      if (recognitions != null) {
        // ignore: avoid_function_literals_in_foreach_calls
        recognitions.forEach((response) {
          arrResult.add(response['label']);
          result += response['label'];
          //+
          //' ' +
          // (response['confidence'] * 100 - 30 as double).toStringAsFixed(2) +
          // "%" +
          // "\n\n";
        });
      }

      setState(() {
        result;
      });

      isWorking = false;
    }
  }

  @override
  void dispose() async {
    super.dispose();

    await Tflite.close();
    cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 158, 212, 253), Color(0xff0c82df)],
              stops: [0, 1],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width - 50,
                      color: const Color.fromARGB(255, 6, 19, 41),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        initCamera();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 500,
                        width: MediaQuery.of(context).size.width - 50,
                        child: imgCamera == null
                            ? SizedBox(
                                height: 500,
                                width: MediaQuery.of(context).size.width - 50,
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.camera,
                                    size: 50,
                                  ),
                                ))
                            : cameraController != null &&
                                    cameraController!.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio:
                                        cameraController!.value.aspectRatio,
                                    child: CameraPreview(cameraController!),
                                  )
                                : Container(),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width - 50,
                  height: 150,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorsColors.primaryColor,
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
                  child: Center(
                    child: SingleChildScrollView(
                      child: TextButton(
                        onPressed: () {
                          // print(result.toLowerCase());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  SearchPage(result.toLowerCase())),
                            ),
                          );
                        },
                        child: Text(
                          result,
                          style: const TextStyle(
                            backgroundColor: Colors.white54,
                            color: Color(0xff154670),
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
