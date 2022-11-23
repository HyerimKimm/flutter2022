import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey,),
                  prefixIconConstraints: BoxConstraints(minWidth: 24, maxHeight: 24),
                  hintText: "주소를 입력하세요.",
                  hintStyle: TextStyle(color: Theme.of(context).hintColor)
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5,right: 5),
              child:
                  TextButton.icon(
                    onPressed: (){},
                    label: Text('현재위치로 찾기'),
                    icon: Icon(Icons.search,color: Colors.white60,),
                  ),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  leading: ExtendedImage.asset('assets/images/loverens.png'),
                  title: Text('address $index', style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('subtitle $index'),);
              }, itemCount: 10, padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),),
            )
          ],
      ),
    );
  }
}
