import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2022/utils/logger.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  void onButtonClick(){
    logger.d('On TextButton Click');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Hyerim\'s Market', style: TextStyle(color:Theme.of(context).primaryColor, fontSize:35, fontWeight: FontWeight.w800 )),
          ExtendedImage.asset('assets/images/together.jpg',scale: 3,),
          Text('패션 킬러 혜림 쇼핑몰',style:TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
          Text('혜림 쇼핑몰은 항상 편하고 개성넘칩니다.\n혜림 쇼핑몰과 함께 당신을 패션으로 표현해보세요',style:TextStyle(fontSize:15)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: onButtonClick,
                  child: Text('내 동네 설정하고 시작하기', style: TextStyle(color:Theme.of(context).primaryColorLight, fontSize: 18, fontWeight: FontWeight.bold),),
                  style: TextButton.styleFrom(
                      fixedSize: Size(380, 45), backgroundColor: Theme.of(context).primaryColor
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}