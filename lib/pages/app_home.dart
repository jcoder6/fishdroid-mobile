import 'package:fishdroid/data/fishes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List<Fish> fishesList = [
    Fish('images/fishes/1.jpg', 'Needlescaled Queenfish', 'Tulong-Tulong', 2,
        'Scomberoides tol', 'Carangidae', 'Some Description'),
    Fish('images/fishes/2.jpg', 'Malabar trevally', 'Talakitok', 2,
        'Carangoides malabaricus', 'Carangidae', 'Some Description'),
    Fish('images/fishes/3.jpg', 'Shortfin scad', 'Galonggong', 2,
        'Decapterus macrosoma', 'Carangidae', 'Some Description'),
    Fish('images/fishes/4.jpg', 'Torpedo scad', 'Bonito', 2,
        'Megalaspis cordyla', 'Carangidae', 'Some Description'),
    Fish('images/fishes/5.jpg', 'Black pomfret', 'Pampano', 2,
        'Parastromateus niger', 'Carangidae', 'Some Description'),
    Fish('images/fishes/6.jpg', 'smalltoothed ponyfish', 'Sap-sap', 2, 'Gazza achlamys', 'Leiognathidae', 'Some Description'),
    Fish('images/fishes/7.jpg', 'Gazza achlamys', 'Sap-sap mabeng', 2, 'Leiognathus elongatus', 'Leiognathidae', 'Some Description'),
    Fish('images/fishes/8.jpg', 'Saddle grunt ', 'Sagsagir', 2, 'Pomadasys maculatus', 'Haemulidae', 'Some Description'),
    Fish('images/fishes/9.jpg', 'Blacktip sardinella', 'Toyo', 2, 'Sardinella melanura', 'Clupeidae', 'Some Description'),
    Fish('images/fishes/10.jpg', 'Batfish', 'Bayong', 2, 'Platax orbicularis', 'Ephippidae', 'Some Description'),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              transform: Matrix4.translationValues(0, -100, 0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff154670),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffC5D7F0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 107, 107, 107)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                                  Offset(2, 2), // Adjust the values as needed
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 25,
                            bottom: 25,
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: FaIcon(
                                  FontAwesomeIcons.filePen,
                                  size: 50,
                                  color: Color(0xff154670),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  'Quiz',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff154670),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffC5D7F0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 107, 107, 107)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                                  Offset(2, 2), // Adjust the values as needed
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 25,
                            bottom: 25,
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: FaIcon(
                                  FontAwesomeIcons.carrot,
                                  size: 50,
                                  color: Color(0xff154670),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  'Nutrition',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff154670),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffC5D7F0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 107, 107, 107)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                                  Offset(2, 2), // Adjust the values as needed
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 25,
                            bottom: 25,
                            left: 30,
                            right: 30,
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: FaIcon(
                                  FontAwesomeIcons.book,
                                  size: 50,
                                  color: Color(0xff154670),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  'Term',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff154670),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffC5D7F0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 107, 107, 107)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                                  Offset(2, 2), // Adjust the values as needed
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 25,
                            bottom: 25,
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: FaIcon(
                                  FontAwesomeIcons.egg,
                                  size: 50,
                                  color: Color(0xff154670),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  'Hatchery',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff154670),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fishBuilder(BuildContext context, int index) {
    var fishItem = fishesList[index];
    return Container(
      height: 250,
      width: 170,
      // margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(2, -2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(fishItem.imgPath),
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 10,
                      bottom: 2,
                    ),
                    child: Text(
                      fishItem.fishName,
                      style: const TextStyle(
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
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        fishItem.localName,
                        style: TextStyle(color: Colors.white, fontSize: 12),
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
