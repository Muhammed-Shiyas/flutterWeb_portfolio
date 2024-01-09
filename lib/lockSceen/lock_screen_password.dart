import 'package:flutter/material.dart';
import 'package:portfolio/providers/current_state.dart';

import 'package:portfolio/screen/home/phone_home_page.dart';
import 'package:provider/provider.dart';

class LockPassword extends StatefulWidget {
  const LockPassword({super.key});

  @override
  State<LockPassword> createState() => _LockPasswordState();
}

class _LockPasswordState extends State<LockPassword> {
  String enteredPassword = "";
  String errorMessage = "";

  void onButtonPressed(String digit) {
    setState(() {
      if (enteredPassword.length < 4) {
        enteredPassword += digit;
        if (enteredPassword.length == 4) {
          checkPasswordAndNavigate();
        }
      }
    });
  }

  void onClearPressed() {
    setState(() {
      enteredPassword = "";
    });
  }

  void checkPasswordAndNavigate() {
    if (enteredPassword == "1234") {
      Provider.of<CurrentState>(context, listen: false)
          .changePhoneScreen(const PhoneHomeScreen(), true);
    } else {
      setState(() {
        errorMessage = "Try again";
        onClearPressed();
      });

      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          errorMessage = "";
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/Lock.jpg',
              fit: BoxFit.cover,
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
                scale: .5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              alignment: const Alignment(0, -1),
              child: Image.asset(
                'assets/images/iphonelock.jpg',
                scale: 35,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 170),
            child: Align(
              alignment: Alignment(0, -1),
              child: Text(
                "Enter Passcode",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 115),
              child: Align(
                alignment: const Alignment(0, -1),
                child: Text(
                  errorMessage,
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          const Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Align(
              alignment: Alignment(0, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Emergency',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '•' * enteredPassword.length,
                  style: const TextStyle(fontSize: 50, color: Colors.white),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildRoundedButton("1"),
                    buildRoundedButton("2"),
                    buildRoundedButton("3"),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildRoundedButton("4"),
                    buildRoundedButton("5"),
                    buildRoundedButton("6"),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildRoundedButton("7"),
                    buildRoundedButton("8"),
                    buildRoundedButton("9"),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildRoundedButton("0"),
                  ],
                ),
              ],
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

  Widget buildRoundedButton(String digit) {
    return ElevatedButton(
      onPressed: () => onButtonPressed(digit),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white54,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
      ),
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        child: Text(
          digit,
          style: const TextStyle(
              fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildRoundedActionButton(String label, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(),
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
