import 'package:flutter/material.dart';
import 'package:flutter_application_a3/Utils/color.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.width,
      color: bannerColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/banner.png",
                height: size.height * 0.25,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
