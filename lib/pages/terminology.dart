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
  TextEditingController searchController = TextEditingController();
  var termImageLink =
      "https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/term_images/";

  @override
  void initState() {
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

  getSearch(input) async {
    termList = await RemoteService().searchTerm(input);

    if(termList != null) {
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
              width: MediaQuery.of(context).size.width - 50,
              margin: const EdgeInsets.only(bottom: 20),
              child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // Perform the search here
                        // You can add your search logic here
                        String searchInput = searchController.text;
                        setState(() {
                          getSearch(searchInput);
                        });
                      },
                    ),
                  ),
                ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                itemCount: termList?.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = termList![index];
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
                      // padding: const EdgeInsets.all(15),
                      // margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 107, 107, 107)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(2, 2), // Adjust the values as needed
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(termImageLink + item.termImg),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white54,
                      ),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          color: const Color.fromARGB(105, 255, 255, 255),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            item.techTerm,
                            softWrap: true,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 32, 32, 32),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            // overflow: TextOverflow.ellipsis,
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
