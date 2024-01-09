// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'ParallaxPageView.dart';

class ProjectsParallax extends StatefulWidget {
  @override
  _ProjectsParallaxState createState() => _ProjectsParallaxState();
}

class _ProjectsParallaxState extends State<ProjectsParallax> {
  late PageController _controller;
  double offset = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.6);
    _controller.addListener(() {
      setState(() {
        offset = _controller.page!;
        //print(offset);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ParallaxPageView(
            controller: _controller,
            offset: offset,
            key: Key(""),
          ),
        ],
      ),
    );
  }
}
