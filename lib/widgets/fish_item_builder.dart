// fish_list_item.dart

import 'package:fishdroid/pages/view_fish_page.dart';
import 'package:flutter/material.dart';
import '../data/fishes.dart';

class FishListItem extends StatelessWidget {
  final Fish fish;

  const FishListItem(this.fish, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewFishPage(fish.fishId),
          ),
        );
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
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
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(fish.imgPath), fit: BoxFit.fill),
                ),
              ),
              Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fish.fishName,
                      style: const TextStyle(color: Color(0xff154670)),
                    ),
                    Text(
                      fish.fishSciName,
                      style: const TextStyle(color: Color(0xff154670)),
                    ),
                    Text(
                      fish.fishFamName,
                      style: const TextStyle(color: Color(0xff154670)),
                    ),
                    Text(
                      fish.localName,
                      style: const TextStyle(color: Color(0xff154670)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
