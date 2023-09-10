import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff0c82df),
      elevation: 0,
      title: Container(
        margin: EdgeInsets.only(top: 10),
        transform: Matrix4.translationValues(-25.0, 0.0, 0.0),
        child: Row(
          children: [
            Image.asset(
              'images/fishdroid-logo.png',
              height: 65,
              width: 65,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            Container(
              transform: Matrix4.translationValues(30.0, -4.0, 0.0),
              child: IconButton(
                onPressed: () => {},
                icon: Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
      // actions: [
      //   IconButton(onPressed: () => {}, icon: Icon(Icons.search)),
      // ],
    );
  }
}
