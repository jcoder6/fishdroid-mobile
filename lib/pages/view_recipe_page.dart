import 'package:flutter/material.dart';
import '../includes/home_app_bar.dart';
import '../includes/home_drawer.dart';

class ViewRecipePage extends StatefulWidget {
  final int fishId, recipeID;
  final String recipeName, recipeImg, recipeSteps;
  const ViewRecipePage(this.fishId, this.recipeID, this.recipeName,
      this.recipeImg, this.recipeSteps,
      {super.key});

  @override
  State<ViewRecipePage> createState() => _ViewRecipePageState();
}

class _ViewRecipePageState extends State<ViewRecipePage> {
  @override
  Widget build(BuildContext context) {
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
                // transform:
                //     Matrix4.translationValues(0, -appBar.preferredSize.height, 0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/img-bg-design/bg-recipe.jpg'),
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
                        'Foods that',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffe81e),
                        ),
                      ),
                      Text(
                        'Fuels Your Soul',
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
                //FISH IMAGE CONTAINER
                height: 200,
                transform: Matrix4.translationValues(0, -90, 0),
                width: MediaQuery.of(context).size.width - 70,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('images/recipes/${widget.recipeImg}'),
                      fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 107, 107, 107).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(2, 2), // Adjust the values as needed
                    ),
                  ],
                ),
              ),
              Container(
                //FISH INFORMATION CONTAINER
                transform: Matrix4.translationValues(0, -90, 0),
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width - 70,
                decoration: BoxDecoration(
                  color: Color(0xffC5D7F0),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 107, 107, 107).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(2, 2), // Adjust the values as needed
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          widget.recipeName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Instruction',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.recipeSteps,
                        style: TextStyle(fontSize: 16, height: 2),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
