import 'package:flutter/material.dart';
import '../includes/home_app_bar.dart';
import '../includes/home_drawer.dart';

class Nutrition extends StatelessWidget {
  const Nutrition({super.key});

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
              transform:
                  Matrix4.translationValues(0, -appBar.preferredSize.height, 0),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('images/img-bg-design/bg-nutrients.jpg'),
                      fit: BoxFit.fill)
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Color.fromARGB(255, 158, 212, 253),
                  //     Color(0xff0c82df)
                  //   ],
                  //   stops: [0, 1],
                  //   begin: Alignment.bottomCenter,
                  //   end: Alignment.topCenter,
                  // ),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Know your',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffe81e),
                      ),
                    ),
                    Text(
                      'Nutrients',
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
              width: MediaQuery.of(context).size.width - 80,
              transform: Matrix4.translationValues(0, -150, 0),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xffC5D7F0),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 107, 107, 107).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(2, -2), // Adjust the values as needed
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Milkfish',
                            style: TextStyle(
                              color: Color(0xff154670),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Scientific Name:',
                            style: TextStyle(
                              color: Color(0xff154670),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Chanos chanos',
                            style: TextStyle(
                              color: Color(0xff154670),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Local Name:',
                            style: TextStyle(
                              color: Color(0xff154670),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Bangus',
                            style: TextStyle(
                              color: Color(0xff154670),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 107, 107, 107)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                                  Offset(1, 1), // Adjust the values as needed
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey,
                          image: DecorationImage(
                              image: AssetImage('images/fishes/1.jpg'),
                              fit: BoxFit.fill),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nutrients',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xff154670),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Omega-3 Fatty Acids',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff154670)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'High Qaulity of Protein',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff154670)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Vitamin D',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff154670)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Vitamin B12',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff154670)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Selenium',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff154670)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Iodine',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff154670)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
