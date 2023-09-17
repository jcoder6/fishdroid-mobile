import 'package:fishdroid/includes/home_app_bar.dart';
import 'package:fishdroid/includes/home_bottom_nav.dart';
import 'package:fishdroid/includes/home_drawer.dart';
import 'package:flutter/material.dart';

class ViewTermPage extends StatefulWidget {
  final int termID;
  const ViewTermPage(this.termID, {super.key});

  @override
  State<ViewTermPage> createState() => _ViewTermPageState();
}

class _ViewTermPageState extends State<ViewTermPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      endDrawer: const HomeDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'View Terminology',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xff154670)),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xffC5D7F0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/eggcollection.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Egg Collection',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff154670),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Broodstock are placed in specially designed tanks or ponds where they release eggs (females) and sperm (males) into the water. Spawning can be natural or artificially induced, as mentioned earlier. After spawning, fish farmers collect the eggs, which are usually adhesive and may stick to surfaces. These eggs are carefully harvested and transferred to incubation units.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, height: 2),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
