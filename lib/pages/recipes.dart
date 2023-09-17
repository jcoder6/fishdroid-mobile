import 'package:fishdroid/includes/below_links.dart';
import 'package:fishdroid/pages/view_recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:fishdroid/data/recipe_data.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  List<Recipe> recipeLists = [
    Recipe(
        1,
        1,
        'Sinigang na Bangus',
        'With only a few simple steps, and with this one pot dish, this healthy and nutritious Sinigang na Bangus cooks your way into your family’s heart. Start by using the water from where you washed your rice, or just fresh water. Pour this into the pot together with the onions and tomatoes. Bring this slowly to a boil then lower the heat to simmer for a few minutes. First add your radish and okra. Let these boil for 2 minutes. Since fish cooks easily, carefully add the fish and long green chilli and simmer gently until cooked through before adding the Sinigang sa Sampaloc Mix Original and kangkong. Make sure that the scales have been removed to eliminate that “malansa” taste from the fish. Stir and simmer. It should be done in a minute. All done and it only took 2 steps to cook this dish. Satisfy everyone’s craving by serving this hot and soothing Sinigang na Bangus with enough rice and surely your family will ask for more.',
        'RECIPE_IMG_001.PNG'),
    Recipe(
        2,
        2,
        'Fried Galunggong with Salted Egg and Tomato Salad',
        'Rub salt all over the fish including the cavity. Let it stay for 15 minutes. Meanwhile, prepare the salted egg and tomato salad by combining all of its ingredients in a bowl, including the fish sauce. Gently toss. Set aside. Heat oil in a frying pan. Once the oil gets hot, put the fish one after the other. Be extra careful during this step as the oil will splatter. Fry until one side of the fish gets brown and crispy. You will know that the fish is ready when the crackling sound from the pan mellows down. Note:If you have a splatter screen, this is the best time to use it. Turn the fish over and do the same step to the opposite side. Remove the fish from the pan. Let the oil drip. Arrange in a serving plate with salted egg and tomato salad. Serve with spicy vinegar. Share and enjoy!',
        'RECIPE_IMG_002.jpg'),
    Recipe(
        3,
        3,
        'Tilapia Milanese',
        'Preheat the oven to 425 degrees F. Soak the fish in a bowl with the milk and 2 cups ice, 15 minutes. Meanwhile, mix the flour with 1/2 teaspoon each salt and pepper in a shallow dish. Lightly beat the eggs in another dish. Pulse the bread, parsley, lemon zest and 1/2 teaspoon salt in a food processor until crumbs form, then transfer to a third dish. One at a time, remove the fillets from the milk and dredge in the flour, shaking off the excess. Dip in the eggs, then coat with the breadcrumbs, gently pressing to coat both sides. Transfer to a large plate. Line a baking sheet with foil. Heat 2 tablespoons each olive oil and butter in a large skillet over medium-high heat. Add 2 fillets and cook until golden, about 3 minutes per side. Transfer to the prepared baking sheet. Repeat with the remaining 2 fillets, adding 2 more tablespoons each olive oil and butter. Transfer the fish to the oven and bake until cooked through, about 8 minutes. Toss the arugula with the remaining 1 to 2 tablespoons olive oil, and salt and pepper to taste. Serve the fish with the salad and lemon wedges.',
        'RECIPE_IMG_003.jpeg'),
    Recipe(
        4,
        4,
        'Sinigang na Bangus',
        'Rub the cleaned fish with salt. Let sit for at least 10 minutes. In a large saucepan, arrange fish and put all the ingredients on top except for the cooking oil. Cover and let it simmer for about fifteen minutes in a low fire or until the vinegar sauce dries up. Pour the cooking oil and continue simmering for a minute. Remove from heat before the fish gets toasted. Serve the dish with steamed rice',
        'RECIPE_IMG_004.jpg'),
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
                    'Best',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff154670),
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
              itemCount: recipeLists.length,
              itemSize: 170,
              onItemFocus: (index) {},
              dynamicItemSize: true,
            ),
          ),
          BelowLinks(),
        ],
      ),
    );
  }

  Widget _fishBuilder(BuildContext context, int index) {
    var recipeItem = recipeLists[index];
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          (context),
          MaterialPageRoute(
            builder: (context) => ViewRecipePage(
              recipeItem.fishID,
              recipeItem.recipeID,
              recipeItem.recipeName,
              recipeItem.recipeImg,
              recipeItem.recipeSteps,
            ),
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
            image: AssetImage('images/recipes/${recipeItem.recipeImg}'),
            fit: BoxFit.cover,
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
      ),
    );
  }
}
