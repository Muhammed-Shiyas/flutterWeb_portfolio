import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/lockSceen/lock_scrren.dart';

import 'package:url_launcher/url_launcher.dart';

class CurrentState extends ChangeNotifier {
  DeviceInfo currentDevice = Devices.ios.iPhone13;
  int knobSelected = 2;
  bool isMainScreen = true;
  String? title;

  void changeSelectedDecice(DeviceInfo device) {
    currentDevice = device;
    notifyListeners();
  }

  Widget currentScreen = const LockScreen();
  void changeGradient(int index) {
    knobSelected = index;
    notifyListeners();
  }

  Future<void> launchInBrowser(String link) async {
    Uri url = Uri.parse(link);
    if (await launchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {}
  }

  void changePhoneScreen(Widget change, bool isMain, {String? titlee}) {
    title = titlee;
    currentScreen = change;
    isMainScreen = isMain;
    notifyListeners();
  }
}
