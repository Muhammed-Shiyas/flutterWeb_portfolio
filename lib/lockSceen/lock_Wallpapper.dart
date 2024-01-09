// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LockWallpaper extends StatelessWidget {
  const LockWallpaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMMM').format(DateTime.now());
    String dayOfWeek = DateFormat('EEEE').format(DateTime.now());
    String time = DateFormat('hh:mm').format(DateTime.now());

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/Lock.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dayOfWeek,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.0,
            right: MediaQuery.of(context).size.width * 0.05,
            child: SizedBox(
              height: 80,
              width: 90,
              child: Image.asset(
                'assets/images/battery-signal.png',
                scale: 1,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-.7, .9),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                  focusColor: Colors.black87,
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/flashlight.png',
                    scale: 15,
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(.7, .9),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                  focusColor: Colors.white60,
                  color: Colors.black,
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/camera.png',
                    scale: 35,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: const Alignment(0, 1),
              child: Container(
                height: 8,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
