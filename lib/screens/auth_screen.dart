import 'package:flutter/material.dart';
import 'package:flutter2022/screens/start/intro_page.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(controller: _pageController, physics: NeverScrollableScrollPhysics(),
        children: [
          IntroPage(_pageController),
          Container(color: Colors.accents[2],),
          Container(color: Colors.accents[3],)
        ])
    );
  }
}
