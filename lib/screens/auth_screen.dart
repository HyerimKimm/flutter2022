import 'package:flutter/material.dart';
import 'package:flutter2022/screens/start/intro_page.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children:[
        IntroPage(),
        Container(color: Colors.accents[2],),
        Container(color: Colors.accents[3],)
      ]),
    );
  }
}
