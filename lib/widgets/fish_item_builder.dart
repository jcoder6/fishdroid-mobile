// fish_list_item.dart

import 'package:fishdroid/includes/colors.dart';
import 'package:fishdroid/includes/extension.dart';
import 'package:fishdroid/pages/view_fish_page.dart';
import 'package:flutter/material.dart';
import '../data/fishes.dart';

class FishListItem extends StatefulWidget {
  final Fish fish;

  const FishListItem(this.fish, {super.key});

  @override
  State<FishListItem> createState() => _FishListItemState();
}

class _FishListItemState extends State<FishListItem> {
  final imgFishLink =
      'https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/fish_images/';

  @override
  Widget build(BuildContext context) {
    final localNameSplit = widget.fish.localName.split(
        ';'); // splittin the localname so that I can only get the firts local name because something local name is too long and it destroy the User Interface
    final localName =
        localNameSplit[0]; // assining the first local name into a variable
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewFishPage(widget.fish.id),
          ),
        );
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: ColorsColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 107, 107, 107).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(2, 2), // Adjust the values as needed
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
                      image: NetworkImage(imgFishLink + widget.fish.fishImage),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.fish.fishName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Color(0xff154670),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.fish.scientificName,
                      style: const TextStyle(color: Color(0xff154670)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.fish.familyName.camelString(),
                      style: const TextStyle(color: Color(0xff154670)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      localName,
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
