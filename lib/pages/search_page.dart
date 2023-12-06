import 'package:fishdroid/data/fishes.dart';
import 'package:fishdroid/includes/home_app_bar.dart';
import 'package:fishdroid/includes/home_drawer.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:fishdroid/widgets/fish_item_builder.dart';
// import 'package:fishdroid/widgets/fish_item_builder.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String search;
  const SearchPage(this.search, {super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Fish>? fishesList;
  var isLoaded = false;

  @override
  initState() {
    super.initState();
    getSearch();
  }

  getSearch() async {
    fishesList = await RemoteService().searchFish(widget.search);
    // print(widget.search);
    if (fishesList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: HomeAppBar(),
      endDrawer: const HomeDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white54,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Image Recognition Result',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff154670),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    child: (fishesList == null)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : (!isLoaded)
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : (fishesList!.isEmpty)
                                ? const Center(
                                    child: Text('No Fish Found'),
                                  )
                                : ListView.builder(
                                    shrinkWrap:
                                        true, // Adjusts the height based on the content
                                    itemCount: fishesList
                                        ?.length, // Replace with the actual number of items in your list
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var item = fishesList![index];
                                      return FishListItem(item);
                                    },
                                  )),

                // You can add other content below the search field if needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
