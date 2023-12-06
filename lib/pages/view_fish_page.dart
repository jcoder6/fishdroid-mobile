import 'package:fishdroid/includes/colors.dart';
import 'package:fishdroid/includes/extension.dart';
import 'package:fishdroid/data/fishes.dart';
import 'package:fishdroid/pages/fish_recipe_list.dart';
import 'package:fishdroid/pages/nutrition.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../includes/home_app_bar.dart';
import '../includes/home_drawer.dart';

class ViewFishPage extends StatefulWidget {
  final int fishId;
  const ViewFishPage(this.fishId, {super.key});

  @override
  State<ViewFishPage> createState() => _ViewFishPageState();
}

class _ViewFishPageState extends State<ViewFishPage> {
  List<Fish>? fish;
  var isLoaded = false;
  var imgFishLink =
      'https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/fish_images/';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentFish();
  }

  getCurrentFish() async {
    fish = await RemoteService().getOneFish(widget.fishId);
    if (fish != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (fish == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      var currFish = fish![0];
      return Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 238, 238, 238),
            appBar: HomeAppBar(),
            endDrawer: const HomeDrawer(),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'View Fish',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff154670),
                        ),
                      ),
                    ),
                    Container(
                      //FISH IMAGE CONTAINER
                      height: 200,
                      width: MediaQuery.of(context).size.width - 80,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image:
                                NetworkImage(imgFishLink + currFish.fishImage),
                            fit: BoxFit.fill),
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
                    ),
                    Container(
                      //FISH INFORMATION CONTAINER
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                        color: ColorsColors.primaryColor,
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                currFish.fishName,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Scientific Name: ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              currFish.scientificName,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Family Name: ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              currFish.familyName.camelString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Local Name: ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              currFish.localName,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            
                            const SizedBox(height: 15),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: currFish.isEdible == 1 ? const Color(0xff154670) : const Color(0xff154670).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: GestureDetector(
                                    onTap: currFish.isEdible == 1
                                      ? () => {
                                        Navigator.push(
                                          (context),
                                          MaterialPageRoute(
                                            builder: (context) => FishRecipeList(
                                              currFish.id.toString(),
                                            ),
                                          ),
                                        ),
                                      }
                                      : null,
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.utensils,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: currFish.isEdible == 1 ? const Color(0xff154670) : const Color(0xff154670).withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: GestureDetector(
                                    onTap: currFish.isEdible == 1
                                      ? () => {
                                        Navigator.push(
                                          (context),
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Nutrition(currFish.id.toString()),
                                          ),
                                        )
                                      }
                                      : null,
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.heartPulse,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                currFish.isEdible == 1 
                                ? const FaIcon(FontAwesomeIcons.check, color: Colors.green,)
                                : const FaIcon(FontAwesomeIcons.xmark, color: Colors.red,),
                                const Text(
                                  '   Can be eaten?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                currFish.isPettable == 0
                                ? const FaIcon(FontAwesomeIcons.xmark, color: Colors.red,)
                                : const FaIcon(FontAwesomeIcons.check, color: Colors.green,),
                                const Text(
                                  '     Can be petted?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Center(
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              currFish.fishInfo,
                              style: const TextStyle(fontSize: 16, height: 2),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    }
  }
}
