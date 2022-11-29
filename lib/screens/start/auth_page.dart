import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2022/utils/logger.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import '../../constants/common_size.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

const duration = Duration(milliseconds: 300);

class _AuthPageState extends State<AuthPage> {
  final inputBorder = OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));

  TextEditingController _phonenumberController = TextEditingController(text: '010');
  TextEditingController _codeController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  VerificationStatus _verificationStatus = VerificationStatus.none;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        Size size = MediaQuery.of(context).size;

        return Form(
          key: _formkey,
          child: Scaffold(
            appBar: AppBar(
              title: Text('전화번호로 로그인', style: Theme.of(context).appBarTheme.titleTextStyle,),
            ),
            body:Padding(
              padding: const EdgeInsets.all(common_padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(children: [
                    ExtendedImage.asset('assets/images/padlock.png', width: size.width*0.15, height: size.width*0.15,),
                    SizedBox(width: common_small_padding,),
                    Text('전화번호는 안전하게 보관되어\n어디에도 공개되지 않아요.')
                  ]),
                  SizedBox(height: common_padding,),
                  TextFormField(
                    controller: _phonenumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      MaskedInputFormatter("000 0000 0000")
                    ],
                    decoration: InputDecoration(
                      focusedBorder: inputBorder, border: inputBorder,
                    ),
                    validator: (number1){
                      if(number1!=null && number1.length==13){
                        return null;
                      }
                      else{
                        return '잘못된 전화번호입니다!';
                      }
                    },
                  ),
                  SizedBox(height: common_small_padding,),
                  TextButton(onPressed: (){
                    logger.d(_formkey.currentState!.validate());
                    if(_formkey.currentState != null){
                     bool passed = _formkey.currentState!.validate();
                     if(passed){
                       setState(() {
                         _verificationStatus = VerificationStatus.codeSent;
                       });
                     }
                    }
                  }, child: Text('인증번호 받기'),),
                  SizedBox(height: common_padding,),
                  AnimatedOpacity(
                    duration: duration,
                    opacity: (_verificationStatus==VerificationStatus.none)?0:1,
                    child: AnimatedContainer(
                      duration: duration,
                      height: getVerificationHeight(status: _verificationStatus, height: 60),
                      child: TextFormField(
                        controller: _codeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          focusedBorder: inputBorder, border: inputBorder,
                        ),
                        inputFormatters: [
                          MaskedInputFormatter("000000")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: common_small_padding,),
                  AnimatedOpacity(
                    duration: duration,
                    opacity: (_verificationStatus==VerificationStatus.none)?0:1,
                    child: AnimatedContainer(
                        duration: duration,
                        height: getVerificationHeight(status: _verificationStatus, height:48),
                        child: TextButton(onPressed: (){

                        }, child: Text('인증번호 확인'))
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  double getVerificationHeight({VerificationStatus status=VerificationStatus.none, double height=0}){
    switch(status){
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return height+common_small_padding;
    }
  }
}

enum VerificationStatus{
  none, codeSent,verifying, verificationDone
}