import 'package:fishdroid/data/hatchery.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:fishdroid/widgets/hatch_item_builder.dart';
import 'package:flutter/material.dart';

class Hatcheries extends StatefulWidget {
  const Hatcheries({super.key});

  @override
  State<Hatcheries> createState() => _HatcheriesState();
}

class _HatcheriesState extends State<Hatcheries> {
  List<HatcheryData>? hatcheryList;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getHatcheryData();
  }

  getHatcheryData() async {
    hatcheryList = await RemoteService().getHatchery();

    if(hatcheryList != null){
      setState(() {
        isLoaded = true;
      });
      print(hatcheryList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(child: CircularProgressIndicator(),),
      child: SingleChildScrollView(
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
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                shrinkWrap: true,
                itemCount: hatcheryList?.length,
                itemBuilder: (BuildContext context, int index) {
                  return HatchItem(hatcheryList![index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
