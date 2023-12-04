import 'package:fishdroid/pages/view_recipe_page.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:fishdroid/data/recipe_data.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  List<Recipe>? recipeLists;
  List<Recipe>? allRecipes;
  var isLoaded = false;
  var isAllRecipe = false;
  var imgRecipeLink =
      "https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/recipe_images/";

  @override
  void initState() {
    super.initState();
    getRecipes();
    getAllRecipes();
  }

  getRecipes() async {
    recipeLists = await RemoteService().getRecipes();
    if (recipeLists != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getAllRecipes() async {
    allRecipes = await RemoteService().allRecipes();
    if (allRecipes != null) {
      setState(() {
        isAllRecipe = true;
      });
    }
  }

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
                image: AssetImage('images/img-bg-design/bg-food.jpg'),
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
                    'Best',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffe81e),
                    ),
                  ),
                  Text(
                    'Recipes',
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
            transform: Matrix4.translationValues(0, -120, 0),
            child: ScrollSnapList(
              itemBuilder: _fishBuilder,
              itemCount: recipeLists?.length ?? 0,
              itemSize: 170,
              onItemFocus: (index) {},
              dynamicItemSize: true,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -70, 0),
            child: const Text(
              'Recipes',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xff154670),
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 650,
              transform: Matrix4.translationValues(0, -50, 0),
              decoration: BoxDecoration(
                color: const Color(0xffC5D7F0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(2, -2),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: isAllRecipe
                  ? ListView.builder(
                      itemCount: allRecipes!.length,
                      itemBuilder: (context, index) {
                        var item = allRecipes![index];
                        return TextButton(
                          onPressed: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (context) => ViewRecipePage(item.id),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xff154670),
                                ),
                              ),
                            ),
                            child: Text(
                              item.recipeName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff154670),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ))
        ],
      ),
    );
  }

  Widget _fishBuilder(BuildContext context, int index) {
    var recipeItem = recipeLists![index];
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          (context),
          MaterialPageRoute(
            builder: (context) => ViewRecipePage(recipeItem.id),
          ),
        )
      },
      child: Container(
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
            image: NetworkImage(imgRecipeLink + recipeItem.recipeImg),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double parentWidth = constraints.maxWidth;
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: parentWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      recipeItem.recipeName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
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
