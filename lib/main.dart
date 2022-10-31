import 'package:flutter/material.dart';
import 'package:flutter2022/splash_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future : Future.delayed(Duration(seconds: 3), ()=>1),
      builder: (context, snapshot) {
        return AnimatedSwitcher(duration: Duration(milliseconds: 300) ,child: _splashLoadingWidget(snapshot));
      }
    );
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if(snapshot.hasError){
      print('error occur while loading. ');
      return Text('Error occur');
    }else if(snapshot.hasData){
      return HyerimApp();
    }else{
      return SplashScreen();
    }
  }
}

class HyerimApp extends StatelessWidget {
  const HyerimApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}

