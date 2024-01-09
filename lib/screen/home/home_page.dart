import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/screen/home/phone_screen_wrapper.dart';

import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    bool isMobile =
        MediaQuery.of(context).size.width < 600; // Adjust the width as needed

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          Size size = constraints.biggest;
          CurrentState currentState =
              Provider.of<CurrentState>(context, listen: false);

          return Stack(
            children: [
              if (!isMobile)
                const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: RiveAnimation.asset(
                      'assets/space.riv',
                      fit: BoxFit.cover,
                    )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height - 80,
                        child: Consumer<CurrentState>(
                          builder: (context, _, __) {
                            return DeviceFrame(
                              device: currentState.currentDevice,
                              screen: ScreenWrapper(
                                childG: currentState.currentScreen,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Generating the List of Icons
                      ...List.generate(
                        devices.length,
                        (index) => Selector<CurrentState, DeviceInfo>(
                          selector: (context, provider) =>
                              provider.currentDevice,
                          builder: (context, _, __) {
                            // Creating CustomButtons
                            return CustomButton(
                              height: 38,
                              width: 38,
                              borderRadius: 100,
                              backgroundColor: Colors.black,
                              onPressed: () {
                                currentState.changeSelectedDecice(
                                    devices[index].device);
                              },
                              isThreeD: true,
                              animate: true,
                              pressed: currentState.currentDevice ==
                                      devices[index].device
                                  ? Pressed.pressed
                                  : Pressed.notPressed,
                              shadowColor: Colors.white,
                              child: Center(
                                child: Icon(
                                  devices[index].data,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment(0, 1),
                  child: SizedBox(
                    height: 30,
                    width: 200,
                    child: Center(
                      child: Text(
                        'passcode is 1234',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
