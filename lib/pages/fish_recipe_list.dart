import 'package:fishdroid/data/recipe_data.dart';
import 'package:fishdroid/includes/home_app_bar.dart';
import 'package:fishdroid/includes/home_drawer.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:fishdroid/widgets/fish_recipe_builder.dart';
import 'package:flutter/material.dart';

class FishRecipeList extends StatefulWidget {
  final String id;
  const FishRecipeList(this.id, {super.key});

  @override
  State<FishRecipeList> createState() => _FishRecipeListState();
}

class _FishRecipeListState extends State<FishRecipeList> {
  List<Recipe>? recipeList;
  var isLoaded = false;
  var imgFishLink = 'https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/fish_images/';

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  getRecipes() async {
    recipeList = await RemoteService().getFishRecipes(widget.id);
    if(recipeList != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(recipeList == null){
      return const Center(child: CircularProgressIndicator(),);
    } else {
      var appBar = AppBar();
      return Scaffold(
        appBar: HomeAppBar(),
        endDrawer: const HomeDrawer(),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator(),),
          child: (recipeList!.isEmpty)
              ? const Center(child: Text('No recipe yet'),)
              : SingleChildScrollView(
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
                      image: AssetImage("images/img-bg-design/bg-food.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipeList![0].fishName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffffe81e),
                          ),
                        ),
                        const Text(
                          'Recipe List',
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
                        ),
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
                      itemCount: recipeList?.length, // Replace with the actual number of items in your list
                      itemBuilder: (BuildContext context, int index) {
                        final recipe = recipeList![index];
                        return FishRecipes(recipe);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}