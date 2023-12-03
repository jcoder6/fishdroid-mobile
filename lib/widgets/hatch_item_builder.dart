import 'package:fishdroid/data/hatchery.dart';
import 'package:fishdroid/pages/view_hatching_page.dart';
import 'package:flutter/material.dart';

class HatchItem extends StatefulWidget {
  final HatcheryData hatchItem;
  const HatchItem(this.hatchItem, {super.key});

  @override
  State<HatchItem> createState() => _HatchItemState();
}

class _HatchItemState extends State<HatchItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          (context),
          MaterialPageRoute(
            builder: (context) => ViewHatcingPage(widget.hatchItem.id),
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
              color: const Color.fromARGB(255, 107, 107, 107).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(2, 2), // Adjust the values as needed
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.hatchItem.fishName,
            style: const TextStyle(
              color: Color(0xff154670),
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
