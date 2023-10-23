import 'package:fishdroid/data/term.dart';
import 'package:fishdroid/includes/home_app_bar.dart';
import 'package:fishdroid/includes/home_drawer.dart';
import 'package:fishdroid/services/remote_services.dart';
import 'package:flutter/material.dart';

class ViewTermPage extends StatefulWidget {
  final int termID;
  const ViewTermPage(this.termID, {super.key});

  @override
  State<ViewTermPage> createState() => _ViewTermPageState();
}

class _ViewTermPageState extends State<ViewTermPage> {
  List<Term>? term;
  var isLoaded = false;
  var imgTermLink =
      'https://raw.githubusercontent.com/jcoder6/fishdroid_local/master/public/assets/images/term_images/';
  @override
  void initState() {
    super.initState();
    getCurrentTerm();
  }

  getCurrentTerm() async {
    term = await RemoteService().getOneTerm(widget.termID.toString());
    if (term != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(term == null){
      return const Center(child: CircularProgressIndicator(),);
    }
    var item = term![0];
    return Scaffold(
      appBar: HomeAppBar(),
      endDrawer: const HomeDrawer(),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'View Terminology',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xff154670)),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xffC5D7F0),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 107, 107, 107).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(2, 2), // Adjust the values as needed
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(imgTermLink + item.termImg),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        item.techTerm,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff154670),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      item.techDesc,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16, height: 2),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
