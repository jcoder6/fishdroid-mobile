// import 'package:fishdroid/pages/home.dart';
//import 'package:fishdroid/pages/view_fish_page.dart';
// import 'package:fishdroid/pages/view_fish_page.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:fishdroid/widgets/fish_item_builder.dart';
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
                    return FishListItem(fish);
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
