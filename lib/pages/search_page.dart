import 'package:fishdroid/data/fishes.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:fishdroid/widgets/fish_item_builder.dart';
// import 'package:fishdroid/widgets/fish_item_builder.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Fish>? fishesList;
  var isLoaded = false;
  TextEditingController searchController = TextEditingController();
  
  getSearch(input) async {
    fishesList = await RemoteService().searchFish(input);

    if(fishesList != null) {
      isLoaded = true;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white54,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
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
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: (fishesList == null) 
                          ? const Center(child: Text('Search Fish'),)
                          : (!isLoaded) 
                              ? const Center(child: CircularProgressIndicator(),)
                              : (fishesList!.isEmpty) 
                                    ? const Center(child: Text('No Fish Found'),)
                                    : ListView.builder(
                                        shrinkWrap: true, // Adjusts the height based on the content
                                        itemCount: fishesList?.length, // Replace with the actual number of items in your list
                                        itemBuilder: (BuildContext context, int index) {
                                          var item = fishesList![index];
                                          return FishListItem(item);
                                        },
                                      )
                    
              ),
    
              // You can add other content below the search field if needed
            ],
          ),
        ),
      ),
    );
  }
}
