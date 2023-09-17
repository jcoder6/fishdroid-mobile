import 'package:fishdroid/includes/home_app_bar.dart';
import 'package:fishdroid/includes/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class ViewHatcingPage extends StatefulWidget {
  final int fishID;
  const ViewHatcingPage(this.fishID, {Key? key}) : super(key: key);

  @override
  State<ViewHatcingPage> createState() => _ViewHatcingPageState();
}

class _ViewHatcingPageState extends State<ViewHatcingPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/HATCH_VIDEO_001.mp4')
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      endDrawer: const HomeDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayer(_controller),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(16.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Bangus Hatching Process',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff154670),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    """BROODSTOCK MANAGEMENT\n\n    Although a scientific breakthrough in 1977, the induced spawning of wild-caught sabalo (adult milkfish) had a low success rate and leads to mortalities. Thus, milkfish were reared to adults in floating net cages (10 m diameter by 3 m deep) and concrete tanks (10 x 10 x 2 m or 10 x 25 x 2 m deep) supplied with flow-through filtered seawater. Sexual maturation began as the broodstock reached 5 years of age (body weight 3 kgs and above). Since then, natural spawning has been observed annually in floating net cages. Eggs are immediately collected to prevent cannibalism by the broodstock using a manually operated sweeper-type egg collector. Fine mesh knots attached to an airlift system made of 4″ diameter PVC pipe collect the eggs in concrete tanks. Egg production of up to 2.5 million/female/season has been attained. Viable eggs are about 80% per spawning, of which 80% hatch. Normal hatchings (straight and without deformities) are usually 80% per spawn. \n\nBROODSTOCK DIET\n\n    A diet formulated by SEAFDEC/AQD to support sexual maturation and production of high quality eggs of milkfish is used to feed the broodstock. The diet contains 36% protein (from imported animal and terrestrial proteins), 6% lipid and vitamin mix. milkfish technology I support supported by more than two decades of r o decades of research COMMERCIAL FRY PRODUCTION The water and feeding management schemes for milkfish larviculture have been developed to ensure mass fry production. Hatchery operations utilize either an intensive (high stocking density, high volume tanks, daily feeding and water change) or a semi-intensive (low stocking density, high volume tanks, minimal water change, feeding with mixed diet) system, with an average survival rate of 30% (from stocked newly-hatched larvae). The technology has been used by the private sector to utilize abandoned shrimp hatcheries.\n\nLIVE TRANSPORT \n\n    A technique that combines utilizing pre-transport starvation anesthetic at capture, chilled transport water, and a sedating dose of anesthesia effectively transports live broodstock. It was tried on 4-13 year old broodstock placed in oxygenated transport plastic bags (2 m long x 0.5 m wide) containing 40-l chilled (20-22°C) seawater and 5 ml 2-phenoxyethanol (anesthetic). The transport bags were then placed in styrofoam boxes. Travel time was 6-7 hours, recovery was fast, and no mortality was recorded. Eggs (embryonic stage) and newly-hatched larvae were also transported in oxygenated plastic bags containing 12-l seawater and supported by straw bags. Optimum density, temperature, and salinity was 100,000- 120,000 eggs or larvae per bag, 28-30°C and 32-34 ppt.\n\nLARVAL DIET\n\n    To minimize the use of mass-cultured rotifers, a formulated larval diet containing adequate nutrition (highly unsaturated fatty acids and vitamin mix) was found to be an effective supplement for rotifers and alternative for the expensive brine shrimp (Artemia) nauplii for milkfish larviculture.
                    """,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              },
            );
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          )),
    );
  }
}
