import 'package:fishdroid/data/fishes.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:fishdroid/data/nutrition_data.dart';
import 'package:flutter/material.dart';
import '../includes/home_app_bar.dart';
import '../includes/home_drawer.dart';

class Nutrition extends StatefulWidget {
  final String fishID;
  const Nutrition(this.fishID, {super.key});

  @override
  State<Nutrition> createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  List<NutriList>? nutritionList;
  List<Fish>? fish;
  var isLoaded = false;
  var imgFishLink =
      'https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/fish_images/';

  @override
  void initState() {
    super.initState();
    getCurrentFish();
    getNutrientList();
  }

  getCurrentFish() async {
    fish = await RemoteService().getOneFish(widget.fishID);
    if (fish != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getNutrientList() async {
    nutritionList = await RemoteService().getNutritions(widget.fishID);
    if (nutritionList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (fish == null || nutritionList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    var appBar = AppBar();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: HomeAppBar(),
      endDrawer: const HomeDrawer(),
      body: SingleChildScrollView(
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
                      image:
                          AssetImage('images/img-bg-design/bg-nutrients.jpg'),
                      fit: BoxFit.fill)
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Color.fromARGB(255, 158, 212, 253),
                  //     Color(0xff0c82df)
                  //   ],
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
                      'Know your',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffe81e),
                      ),
                    ),
                    Text(
                      'Nutrients',
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
              width: MediaQuery.of(context).size.width - 80,
              transform: Matrix4.translationValues(0, -150, 0),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xffC5D7F0),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 107, 107, 107)
                        .withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(2, -2), // Adjust the values as needed
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width - 200,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 107, 107, 107)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(1, 1), // Adjust the values as needed
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                      image: DecorationImage(
                          image: NetworkImage(imgFishLink + fish![0].fishImage),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            fish![0].fishName,
                            style: const TextStyle(
                              color: Color(0xff154670),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Scientific Name:',
                            style: TextStyle(
                              color: Color(0xff154670),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            fish![0].scientificName,
                            style: const TextStyle(
                              color: Color(0xff154670),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Local Name:',
                            style: TextStyle(
                              color: Color(0xff154670),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            fish![0].localName,
                            style: const TextStyle(
                              color: Color(0xff154670),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nutrients',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xff154670),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: (nutritionList!.isNotEmpty)
                              ? ListView.builder(
                                  itemCount: nutritionList!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var item = nutritionList![index];
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 15),
                                      child: Text(
                                        item.nutritionName,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154670)),
                                      ),
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text('No nutrition added yet'),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}