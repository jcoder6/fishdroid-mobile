import 'package:fishdroid/includes/below_links.dart';
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
  var isLoaded = false;
  var imgRecipeLink = "https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/recipe_images/";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipes();
  }

  getRecipes() async {
    recipeLists = await RemoteService().getRecipes();
    if(recipeLists != null){
      setState(() {
        isLoaded = true;
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
              itemCount: recipeLists?.length ?? 0,
              itemSize: 170,
              onItemFocus: (index) {},
              dynamicItemSize: true,
            ),
          ),
          const BelowLinks(),
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
