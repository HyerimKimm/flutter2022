import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter2022/router/locations.dart';
import 'package:flutter2022/screens/auth_screen.dart';
import 'package:flutter2022/screens/splash_screen.dart';
import 'package:flutter2022/utils/logger.dart';

final _routedelegate = BeamerDelegate(
  guards: [BeamGuard(pathBlueprints: ['/'], check: (context, location){
    return false;
  },showPage: BeamPage(child: AuthScreen()),
  )],
    locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()])
);

void main(){
  logger.d;
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
    return MaterialApp.router(
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          primaryColorLight:Colors.white,
          primaryColorDark: Colors.indigo,
          fontFamily: 'NotoSansKR',
          hintColor: Colors.grey[350]
      ),
      routeInformationParser: BeamerParser(), routerDelegate: _routedelegate,
    );
  }
}