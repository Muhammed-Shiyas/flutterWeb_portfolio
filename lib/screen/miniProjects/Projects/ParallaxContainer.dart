// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Uri link = Uri.parse("https://github.com/Muhammed-Shiyas");

class ParallaxContainer extends StatefulWidget {
  final String index;
  final double offset;
  final double i;
  final String text;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  ParallaxContainer({
    required this.index,
    required this.offset,
    required this.i,
    required this.text,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ParallaxContainerState createState() => _ParallaxContainerState();
}

class _ParallaxContainerState extends State<ParallaxContainer> {
  //THIS VARIABLE ARE USED TO AFFECT THE SIZE OF THE CARD USING ANIMATED PADDING WIDGET
  double bottomPad = 40.0;
  double topPad = 0.0;
  double horiPad = 25.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (value) {
        setState(() {
          bottomPad = 50.0;
          topPad = 10.0;
          horiPad = 35.0;
        });
      },
      onTapUp: (value) {
        setState(() {
          setState(() {
            bottomPad = 40.0;
            topPad = 0.0;
            horiPad = 25.0;
          });
        });
      },

      // THIS WIDGET HELPS US TO MAKE THE CARD TOUCH REACTIVE...
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.only(
          left: horiPad,
          right: horiPad,
          bottom: bottomPad,
          top: topPad,
        ),
        child: Stack(
          children: [
            //THIS WIDGET IS ADDED INORDER TO GIVE US SOME ELEVATION...
            Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/Images/projects/${widget.index}.jpg',
                          fit: BoxFit.cover,
                          alignment: Alignment(
                              0.0, -((widget.offset.abs() + 0.4) - widget.i)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: 35.0,
                          width: 50,
                          child: FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              launchInBrowser(link.toString());
                            },
                            splashColor: Colors.black,
                            child: const Text(
                              'Code',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //THIS IS FOR THE TEXT ABOVE THE IMAGE...
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: const EdgeInsets.only(left: 35.0),
                        height: 110.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.text,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Source Code on github',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // THIS WIDGET IS TO ADD THE TEXT ABOVE THE FIRST LIST ITEM...
            (widget.index == '0')
                ? const OverflowBox(
                    minWidth: 0.0,
                    maxWidth: 200.0,
                    minHeight: 0.0,
                    maxHeight: 100.0,
                    alignment: Alignment(0.0, -1.50),
                    child: Column(
                      children: [
                        Text(
                          'Hey, guys! Check out my projects.',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

Future<void> launchInBrowser(link) async {
  Uri url = Uri.parse(link);
  if (await launchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {}
}
