import 'package:flutter/material.dart';
import 'src/pages/slideshow_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Onboarding Samaria P',
        home: SlideshowPage());
  }
}
