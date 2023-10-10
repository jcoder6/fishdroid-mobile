// import 'package:fishdroid/pages/home.dart';
//import 'package:fishdroid/pages/view_fish_page.dart';
import 'package:fishdroid/widgets/fish_item_builder.dart';
import 'package:flutter/material.dart';

import '../data/fishes.dart';

class FishPages extends StatefulWidget {
  const FishPages({Key? key}) : super(key: key);

  @override
  State<FishPages> createState() => _FishPagesState();
}

class _FishPagesState extends State<FishPages> {
  List<Fish> fishesList = [
    Fish('images/fishes/1.jpg', 'Needlescaled Queenfish', 'Tulong-Tulong', 1,
        'Scomberoides tol', 'Carangidae', 'Some Description'),
    Fish('images/fishes/2.jpg', 'Malabar trevally', 'Talakitok', 2,
        'Carangoides malabaricus', 'Carangidae', 'Some Description'),
    Fish('images/fishes/3.jpg', 'Shortfin scad', 'Galonggong', 3,
        'Decapterus macrosoma', 'Carangidae', 'Some Description'),
    Fish('images/fishes/4.jpg', 'Torpedo scad', 'Bonito', 4,
        'Megalaspis cordyla', 'Carangidae', 'Some Description'),
    Fish('images/fishes/5.jpg', 'Black pomfret', 'Pampano', 5,
        'Parastromateus niger', 'Carangidae', 'Some Description'),
    Fish('images/fishes/6.jpg', 'smalltoothed ponyfish', 'Sap-sap', 6,
        'Gazza achlamys', 'Leiognathidae', 'Some Description'),
    Fish('images/fishes/7.jpg', 'Gazza achlamys', 'Sap-sap mabeng', 7,
        'Leiognathus elongatus', 'Leiognathidae', 'Some Description'),
    Fish('images/fishes/8.jpg', 'Saddle grunt ', 'Sagsagir', 8,
        'Pomadasys maculatus', 'Haemulidae', 'Some Description'),
    Fish('images/fishes/9.jpg', 'Blacktip sardinella', 'Toyo', 9,
        'Sardinella melanura', 'Clupeidae', 'Some Description'),
    Fish('images/fishes/10.jpg', 'Batfish', 'Bayong', 10, 'Platax orbicularis',
        'Ephippidae', 'Some Description'),
  ];

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar();
    return SingleChildScrollView(
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
                itemCount: fishesList
                    .length, // Replace with the actual number of items in your list
                itemBuilder: (BuildContext context, int index) {
                  var item = fishesList[index];
                  return FishListItem(item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
