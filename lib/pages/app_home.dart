import 'package:fishdroid/data/fishes.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List<Fish> fishesList = [
    Fish('images/fishes/fish1.jpg', 'Pantat', 'Basta Isda', 2),
    Fish('images/fishes/fish1.jpg', 'Pantat', 'Basta Isda', 2),
    Fish('images/fishes/fish1.jpg', 'Pantat', 'Basta Isda', 2),
    Fish('images/fishes/fish1.jpg', 'Pantat', 'Basta Isda', 2),
    Fish('images/fishes/fish1.jpg', 'Pantat', 'Basta Isda', 2),
  ];

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar();
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height) /
              2,
          transform:
              Matrix4.translationValues(0, -appBar.preferredSize.height, 0),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color.fromARGB(255, 158, 212, 253), Color(0xff0c82df)],
            stops: [0, 1],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff154670),
                  ),
                ),
                Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 20.0, // shadow blur
                        color: Color.fromARGB(115, 0, 0, 0), // shadow color
                        offset:
                            Offset(-1.0, -1.0), // how much shadow will be shown
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
            height: 250,
            transform: Matrix4.translationValues(0, -150, 0),
            // width: 170,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.black.withOpacity(0.3),
            //       spreadRadius: 2,
            //       blurRadius: 5,
            //       offset: Offset(2, -2), // Adjust the values as needed
            //     ),
            //   ],
            // ),
            child: ScrollSnapList(
              itemBuilder: _fishBuilder,
              itemCount: fishesList.length,
              itemSize: 170,
              onItemFocus: (index) {},
              dynamicItemSize: true,
              ),
            ),
        Container(),
      ],
    );
  }

  Widget _fishBuilder(BuildContext context, int index) {
    return Container(
              height: 250,
              width: 170,
              // margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                    offset: Offset(2, -2),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("images/fishes/pish.PNG"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double parentWidth = constraints.maxWidth;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0, .3, 0),
                          color: Colors.black.withOpacity(.5),
                          width: parentWidth,
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              top: 10,
                              bottom: 2,
                            ),
                            child: Text(
                              'Pantat',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          child: Container(
                            color: Colors.black.withOpacity(.5),
                            width: parentWidth,
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                'Basta isda',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
  }
}
