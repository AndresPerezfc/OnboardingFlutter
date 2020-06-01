import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/slider_model.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  Slideshow(
      {@required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = const Color(0xff5abd8c),
      this.colorSecundario = const Color(0xffD6EEE2)});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              if (this.puntosArriba)
                _Dots(this.slides.length, this.colorSecundario,
                    this.colorPrimario),
              Expanded(child: _Slides(this.slides)),
              if (!this.puntosArriba)
                _Dots(this.slides.length, this.colorSecundario,
                    this.colorPrimario)
            ],
          ),
        ),
      ),
    );
  }
}

//-------------------------------------------

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Color colorPrimario;
  final Color colorSecundario;

  _Dots(this.totalSlides, this.colorSecundario, this.colorPrimario);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //children: <Widget>[_Dot(0), _Dot(1), _Dot(2)],
        children: List.generate(this.totalSlides,
            (i) => _Dot(i, this.colorSecundario, this.colorPrimario)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorPrimario;
  final Color colorSecundario;

  _Dot(this.index, this.colorSecundario, this.colorPrimario);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
              ? this.colorPrimario
              : this.colorSecundario,
          shape: BoxShape.circle),
    );
  }
}

//--------------Slides------------------------------------------

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        /*children: <Widget>[
          _Slide('assets/svg/slide-1.svg'),
          _Slide('assets/svg/slide-2.svg'),
          _Slide('assets/svg/slide-3.svg'),
        ],*/
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}
