import 'package:fishdroid/data/fishes.dart';
import 'package:fishdroid/widgets/fish_item_builder.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Fish> fishesList = [
    Fish('images/fishes/1.jpg', 'Needlescaled Queenfish', 'Tulong-Tulong', 1,
        'Scomberoides tol', 'Carangidae', 'Some Description'),
    Fish('images/fishes/2.jpg', 'Malabar trevally', 'Talakitok', 2,
        'Carangoides malabaricus', 'Carangidae', 'Some Description'),
    Fish('images/fishes/3.jpg', 'Shortfin scad', 'Galonggong', 3,
        'Decapterus macrosoma', 'Carangidae', 'Some Description'),
  ];
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
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                      // You can add your search logic here
                      print('nag serch yarn ng fish?');
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
                child: ListView.builder(
                  shrinkWrap: true, // Adjusts the height based on the content
                  itemCount: fishesList
                      .length, // Replace with the actual number of items in your list
                  itemBuilder: (BuildContext context, int index) {
                    var item = fishesList[index];
                    return FishListItem(item);
                  },
                ),
              ),
    
              // You can add other content below the search field if needed
            ],
          ),
        ),
      ),
    );
  }
}
