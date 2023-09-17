// import 'package:fishdroid/data/hatchery_data.dart';
import 'package:fishdroid/data/term.dart';
// import 'package:fishdroid/pages/view_hatching_page.dart';
import 'package:fishdroid/pages/view_term_page.dart';
import 'package:flutter/material.dart';

class Termniology extends StatefulWidget {
  const Termniology({super.key});

  @override
  State<Termniology> createState() => _TermniologyState();
}

class _TermniologyState extends State<Termniology> {
  @override
  Widget build(BuildContext context) {
    List<TermData> termList = [
      TermData(1, 'Hatching', "TERM_IMG_001", 'Term Definition'),
      TermData(2, 'Fish Eggs Incubation', "TERM_IMG_002", 'Term Definition'),
      TermData(3, 'Larve Rearing', "TERM_IMG_003", 'Term Definition'),
      TermData(4, 'Selection of Broodstock', "TERM_IMG_004", 'Term Definition'),
      TermData(5, 'Spawning', "TERM_IMG_005", 'Term Definition'),
      TermData(1, 'Environmental Considerations', "TERM_IMG_001", 'Term Definition'),
      TermData(2, 'Hormone Induction', "TERM_IMG_002", 'Term Definition'),
      TermData(3, 'Egg Collection', "TERM_IMG_003", 'Term Definition'),
      TermData(4, 'Selection of Broodstock', "TERM_IMG_004", 'Term Definition'),
      TermData(5, 'Market Distribution or Stocking', "TERM_IMG_005", 'Term Definition'),
      TermData(1, 'Hatching', "TERM_IMG_001", 'Term Definition'),
      TermData(2, 'Fish Eggs Incubation', "TERM_IMG_002", 'Term Definition'),
      TermData(3, 'Larve Rearing', "TERM_IMG_003", 'Term Definition'),
      TermData(4, 'Selection of Broodstock', "TERM_IMG_004", 'Term Definition'),
      TermData(5, 'Spawning', "TERM_IMG_005", 'Term Definition'),
    ];

    var count = 0;

    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Terminologies',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff154670),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: termList.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = termList[index];
                  count++;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        (context),
                        MaterialPageRoute(
                          builder: (context) => ViewTermPage(item.id),
                        ),
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                        // margin: EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                          color: Colors.white54,
                          border: Border(
                            bottom:
                                BorderSide(color: Color(0xff154670), width: 1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              count.toString(),
                              style: const TextStyle(
                                color: Color(0xff154670),
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              item.term,
                              style: const TextStyle(
                                color: Color(0xff154670),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )),
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
