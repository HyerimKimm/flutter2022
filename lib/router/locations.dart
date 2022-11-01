import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter2022/screens/home_screen.dart';

class HomeLocation extends BeamLocation{
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [BeamPage(child: homeScreen(), key: ValueKey('home'))];
  }

  @override
  // TODO: implement pathBlueprints
  List get pathBlueprints => ['/'];
}