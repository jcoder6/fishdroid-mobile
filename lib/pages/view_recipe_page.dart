import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../includes/home_app_bar.dart';
import '../includes/home_drawer.dart';

class ViewRecipePage extends StatefulWidget {
  final int fishId, recipeID;
  final String recipeName, recipeImg, recipeSteps;
  const ViewRecipePage(this.fishId, this.recipeID, this.recipeName, this.recipeImg, this.recipeSteps, {super.key});

  @override
  State<ViewRecipePage> createState() => _ViewRecipePageState();
}

class _ViewRecipePageState extends State<ViewRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: HomeAppBar(),
        endDrawer: const HomeDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //FISH IMAGE CONTAINER
                height: 200,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('images/recipes/${widget.recipeImg}'), fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 107, 107, 107).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(2, 2), // Adjust the values as needed
                    ),
                  ],
                ),
              ),
              Container(
                //FISH INFORMATION CONTAINER
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffC5D7F0),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 107, 107, 107).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(2, 2), // Adjust the values as needed
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          widget.recipeName,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Instruction',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
