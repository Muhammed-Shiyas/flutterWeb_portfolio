import 'package:flutter/material.dart';

import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/screen/home/home_page.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CurrentState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) {
            return const HomePage();
          },
        ),
      ),
    );
  }
}
