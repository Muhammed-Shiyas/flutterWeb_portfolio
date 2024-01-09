import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:provider/provider.dart';

class PhoneHomeScreen extends StatelessWidget {
  const PhoneHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String time = DateFormat('hh:mm').format(DateTime.now());
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    return Stack(children: [
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
            scale: 1,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, top: 20),
        child: Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 65, left: 28),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              children: [
                ...List.generate(
                    apps.length,
                    (index) => Container(
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, top: 10, bottom: 20),
                          child: Column(
                            children: [
                              CustomButton(
                                margin: const EdgeInsets.only(bottom: 5),
                                borderRadius: 14,
                                onPressed: () {
                                  if (apps[index].link != null) {
                                    // open the url in the webpage
                                    currentState.launchInBrowser(
                                      apps[index].link!,
                                    );
                                  } else if (apps[index].screen != null) {
                                    currentState.changePhoneScreen(
                                        apps[index].screen!, false,
                                        titlee: apps[index].title);
                                  }
                                },
                                width: 67,
                                height: 67,
                                asset: apps[index].assetPath != null
                                    ? ButtonAsset(
                                        apps[index].assetPath!,
                                        width: 67,
                                        height: 67,
                                      )
                                    : null,
                                backgroundColor: apps[index].color,
                                child: apps[index].assetPath == null
                                    ? Center(
                                        child: Icon(
                                          apps[index].icon,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                      )
                                    : null,
                              ),
                              SizedBox(
                                width: 65,
                                child: Center(
                                  child: Text(
                                    apps[index].title,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
              ],
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Align(
          alignment: const Alignment(0, 1),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white60,
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent.withOpacity(0.2),
                ),
              ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    // Take only the items at index 9, 10, 11, and 12
                    apps.length >= 13 ? 4 : apps.length - 9,
                    (index) => Container(
                      margin: const EdgeInsets.only(
                          right: 10, left: 10, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            margin: const EdgeInsets.only(bottom: 5),
                            borderRadius: currentState.currentDevice ==
                                    Devices.ios.iPhone13
                                ? 14
                                : 100,
                            onPressed: () {
                              int adjustedIndex = index + 9;
                              if (adjustedIndex < apps.length) {
                                if (apps[adjustedIndex].link != null) {
                                  // open the url in the webpage
                                  currentState.launchInBrowser(
                                    apps[adjustedIndex].link!,
                                  );
                                } else if (apps[adjustedIndex].screen != null) {
                                  currentState.changePhoneScreen(
                                      apps[adjustedIndex].screen!, false,
                                      titlee: apps[adjustedIndex].title);
                                }
                              }
                            },
                            width: 67,
                            height: 67,
                            asset: apps[index + 9].assetPath != null
                                ? ButtonAsset(apps[index + 9].assetPath!,
                                    width: 67, height: 67)
                                : null,
                            backgroundColor: apps[index + 9].color,
                            child: apps[index + 9].assetPath == null
                                ? Center(
                                    child: Icon(
                                      apps[index + 9].icon,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
