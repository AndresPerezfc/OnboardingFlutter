import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Slideshow(
      bulletPrimario: 20.0,
      bulletSecundario: 12.0,
      puntosArriba: false,
      slides: <Widget>[
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-1.svg'),
      ],
    ));
  }
}
