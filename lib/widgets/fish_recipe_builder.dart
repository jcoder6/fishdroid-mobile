import 'package:fishdroid/data/recipe_data.dart';
import 'package:fishdroid/pages/view_recipe_page.dart';
import 'package:flutter/material.dart';

class FishRecipes extends StatefulWidget {
  final Recipe recipe;
  const FishRecipes(this.recipe, {super.key});

  @override
  State<FishRecipes> createState() => _FishRecipesState();
}

class _FishRecipesState extends State<FishRecipes> {
  @override
  Widget build(BuildContext context) {
    var recipeItem = widget.recipe;
    var imgRecipeLink =
        "https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/recipe_images/";
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xffC5D7F0),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 107, 107, 107).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(2, 2), // Adjust the values as needed
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => {
          Navigator.push((context), MaterialPageRoute(builder: (context) => ViewRecipePage(recipeItem.id)),)
        },
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgRecipeLink + recipeItem.recipeImg),
                  fit: BoxFit.fill
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                recipeItem.recipeName,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xff154670)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
