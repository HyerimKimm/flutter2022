import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  void onButtonClick(){}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hyerim\'s Market'),
        ExtendedImage.asset('assets/images/together.jpg',scale: 4,),
        Text('패션 킬러 혜림 솨핑몰'),
        Text('Feel so Good in Hyerim\'s shopping mall'),
        TextButton(onPressed: onButtonClick, child: Text('내 동네 설정하고 시작하기'))
      ],
    );
  }
}
