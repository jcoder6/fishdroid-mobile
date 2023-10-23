// import 'package:fishdroid/data/hatchery_data.dart';
import 'package:fishdroid/data/term.dart';
// import 'package:fishdroid/pages/view_hatching_page.dart';
import 'package:fishdroid/pages/view_term_page.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:flutter/material.dart';

class Termniology extends StatefulWidget {
  const Termniology({super.key});

  @override
  State<Termniology> createState() => _TermniologyState();
}

class _TermniologyState extends State<Termniology> {
  List<Term>? termList;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTermList();
  }

  getTermList() async {
    termList = await RemoteService().getTerms();

    if (termList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var count = 0;

    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: SingleChildScrollView(
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
                itemCount: termList?.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = termList![index];
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
                      padding: const EdgeInsets.all(15),
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
                            item.techTerm.length <= 35
                                ? item.techTerm
                                // ignore: prefer_interpolation_to_compose_strings
                                : item.techTerm.substring(0, 35) +
                                    '...', // Truncate text if it's longer than 15 characters.
                            style: const TextStyle(
                              color: Color(0xff154670),
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
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
