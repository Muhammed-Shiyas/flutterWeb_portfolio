import 'package:flutter/material.dart';
import 'package:portfolio/consts/data.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              email,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "+91 9562001296",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
