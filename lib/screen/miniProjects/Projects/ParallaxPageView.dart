// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'ParallaxContainer.dart';

class ParallaxPageView extends StatefulWidget {
  const ParallaxPageView({
    required Key key,
    required PageController controller,
    required this.offset,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;
  final double offset;

  @override
  // ignore: library_private_types_in_public_api
  _ParallaxPageViewState createState() => _ParallaxPageViewState();
}

class _ParallaxPageViewState extends State<ParallaxPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      pageSnapping: false,
      scrollDirection: Axis.vertical,
      controller: widget._controller,
      children: [
        ParallaxContainer(
          index: '0', // THIS IS USED TO GIVE THE NAME OF THE IMAGE Eg. 1.jpg
          offset: widget.offset,
          i: 0.0, // THIS IS TO PROVIDE THE INDEX FOR THE PARALLAX EFFECT START AND STOP SO THAT ITS SCROLLS PERFECTLY WHEN IT APPEEARS ON THE SCREEN
          text: 'E-Campus',
        ),
        ParallaxContainer(
          index: '1',
          offset: widget.offset,
          i: 1.0,
          text: 'Portfoilo',
        ),
        ParallaxContainer(
          index: '2',
          offset: widget.offset,
          i: 2.0,
          text: 'Journy',
        ),
        ParallaxContainer(
          index: '3',
          offset: widget.offset,
          i: 3.0,
          text: 'coming soon',
        ),
        ParallaxContainer(
          index: '4',
          offset: widget.offset,
          i: 4.0,
          text: 'coming soon',
        ),
        ParallaxContainer(
          index: '5',
          offset: widget.offset,
          i: 5.0,
          text: 'coming soon',
        )
      ],
    );
  }
}
