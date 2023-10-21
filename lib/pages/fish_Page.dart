// import 'package:fishdroid/pages/home.dart';
//import 'package:fishdroid/pages/view_fish_page.dart';
import 'package:fishdroid/pages/view_fish_page.dart';
import 'package:fishdroid/services/remote_services.dart';
// import 'package:fishdroid/widgets/fish_item_builder.dart';
import 'package:flutter/material.dart';

import '../data/fishes.dart';

class FishPages extends StatefulWidget {
  const FishPages({Key? key}) : super(key: key);

  @override
  State<FishPages> createState() => _FishPagesState();
}

class _FishPagesState extends State<FishPages> {
  List<Fish>? fishesList;
  var isLoaded = false;
  var imgFishLink = 'https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/fish_images/';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFishData();
  }

  getFishData() async {
    fishesList = await RemoteService().getFishes();
    if(fishesList != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar();
    return Visibility(
      visible: isLoaded,
      replacement: const Center(child: CircularProgressIndicator()),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) /
                  2,
              transform:
                  Matrix4.translationValues(0, -appBar.preferredSize.height, 0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/img-bg-design/bg-feature.jpg'),
                  fit: BoxFit.fill,
                ),
                // gradient: LinearGradient(
                //   colors: [Color.fromARGB(255, 158, 212, 253), Color(0xff0c82df)],
                //   stops: [0, 1],
                //   begin: Alignment.bottomCenter,
                //   end: Alignment.topCenter,
                // ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffe81e),
                      ),
                    ),
                    Text(
                      'Fishes',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 20.0, // shadow blur
                            color: Color.fromARGB(115, 0, 0, 0), // shadow color
                            offset: Offset(
                                -1.0, -1.0), // how much shadow will be shown
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -120, 0),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 40,
                  left: 40,
                ),
                child: ListView.builder(
                  shrinkWrap: true, // Adjusts the height based on the content
                  itemCount: fishesList?.length ?? 0, // Replace with the actual number of items in your list
                  itemBuilder: (BuildContext context, int index) {
                    final fish = fishesList![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewFishPage(fish.id),
                          ),
                        );
                      },
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
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
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(imgFishLink + fish.fishImage), fit: BoxFit.fill),
                                ),
                              ),
                              Container(
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      fish.fishName,
                                      style: const TextStyle(color: Color(0xff154670)),
                                    ),
                                    Text(
                                      fish.scientificName,
                                      style: const TextStyle(color: Color(0xff154670)),
                                    ),
                                    Text(
                                      fish.familyName,
                                      style: const TextStyle(color: Color(0xff154670)),
                                    ),
                                    Text(
                                      fish.localName,
                                      style: const TextStyle(color: Color(0xff154670)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
