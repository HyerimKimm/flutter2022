import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2022/utils/logger.dart';

class IntroPage extends StatelessWidget {
  PageController controller;
  IntroPage(this.controller, {Key? key}) : super(key: key);

  void onButtonClick(){
    controller.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease, );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint){
      Size size = MediaQuery.of(context).size;

      final sizeOfPosXImg = size.width*0.1;
      final sizeOfPosYImg = size.height*0.1;
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Hyerim\'s Market', style: TextStyle(color:Theme.of(context).primaryColor, fontSize:35, fontWeight: FontWeight.w800, fontFamily: 'bujangnimnunchi' )),
            Stack(
              alignment: Alignment(0,0.9),
              children: [
                ExtendedImage.asset('assets/images/together.jpg',scale: 4,),
                ExtendedImage.asset('assets/images/loverens.png',scale: 6,),],
            ),
            Text('패션 킬러 혜림 쇼핑몰',style:TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
            Text('혜림 쇼핑몰은 항상 편하고 개성넘칩니다.\n혜림 쇼핑몰과 함께 당신을 패션으로 표현해보세요',style:TextStyle(fontSize:15)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    onPressed: onButtonClick,
                    child: Text('내 동네 설정하고 시작하기', style: TextStyle(color:Theme.of(context).primaryColorLight, fontSize: 18, fontWeight: FontWeight.bold, ),),
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
    });
  }
}