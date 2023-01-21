import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double imgwidth;
  final double imgheight;
  final String imgUrl;
  final BoxFit? fit;

  const AppIcon(
      {super.key,
      required this.imgUrl,
      required this.imgwidth,
      required this.imgheight,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 27, left: 43, right: 43, bottom: 22),
      child: Center(
        child: Image(
            image: AssetImage(imgUrl),
            width: imgwidth,
            height: imgheight,
            fit: fit),
      ),
    );
  }
}
