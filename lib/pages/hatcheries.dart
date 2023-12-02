import 'package:fishdroid/data/hatchery_data.dart';
import 'package:fishdroid/pages/view_hatching_page.dart';
import 'package:flutter/material.dart';

class Hatcheries extends StatefulWidget {
  const Hatcheries({super.key});

  @override
  State<Hatcheries> createState() => _HatcheriesState();
}

class _HatcheriesState extends State<Hatcheries> {
  @override
  Widget build(BuildContext context) {
    List<HatcheryData> hatcheryList = [
      HatcheryData(1, 1, 'Bangus', "HATCH_VIDEO_001", 'Some Hatching Process'),
      HatcheryData(2, 2, 'Tilapia', "HATCH_VIDEO_002", 'Some Hatching Process'),
    ];

    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Hatching Process',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff154670),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                shrinkWrap: true,
                itemCount: hatcheryList.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = hatcheryList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        (context),
                        MaterialPageRoute(
                          builder: (context) => ViewHatcingPage(item.fishID),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffC5D7F0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 107, 107, 107)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                2, 2), // Adjust the values as needed
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          item.fishName,
                          style: const TextStyle(
                            color: Color(0xff154670),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
