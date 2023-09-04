import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../includes/home_app_bar.dart';
import '../includes/home_drawer.dart';

class ViewFishPage extends StatefulWidget {
  final int fishId;
  const ViewFishPage(this.fishId, {super.key});

  @override
  State<ViewFishPage> createState() => _ViewFishPageState();
}

class _ViewFishPageState extends State<ViewFishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: HomeAppBar(),
        endDrawer: const HomeDrawer(),
        body: Column(
          children: [
            Container(
              //FISH IMAGE CONTAINER
              height: 200,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('images/fishes/6.jpg'), fit: BoxFit.fill),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset of the shadow
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
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Smalltoothed Ponyfish',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Scientific Name: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Gazza Achlamys',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Family Name: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Leiognathidae',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Local Name: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Sap Sap',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    const SizedBox(height: 10),
                    Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula ante eu purus bibendum, at fermentum libero efficitur. Cras ut quam euismod, vulputate nunc sed, fringilla quam. Integer vestibulum mi at neque cursus, id bibendum orci laoreet', 
                      style: TextStyle(fontSize: 16, height: 1.5),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
