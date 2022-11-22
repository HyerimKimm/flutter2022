import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../constants/common_size.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final inputBorder = OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        Size size = MediaQuery.of(context).size;

        return Scaffold(
          appBar: AppBar(
            title: Text('전화번호로 로그인', style: Theme.of(context).appBarTheme.titleTextStyle,),
          ),
          body:Padding(
            padding: const EdgeInsets.all(common_padding),
            child: Column(
              children: [
                Row(children: [
                  ExtendedImage.asset('assets/images/padlock.png', width: size.width*0.15, height: size.width*0.15,),
                  SizedBox(width: common_small_padding,),
                  Text('전화번호는 안전하게 보관되어\n어디에도 공개되지 않아요.')
                ]),
                SizedBox(height: common_padding,),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: inputBorder, border: inputBorder,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
