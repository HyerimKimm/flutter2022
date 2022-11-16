import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(16),
      child: Column(
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton.icon(
                    onPressed: (){},
                    label: Text('현재위치로 찾기', style: TextStyle(color: Colors.white, fontSize: 18),),
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColorDark,
                    ),
                    icon: Icon(Icons.search,color: Colors.white60,),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  leading: ExtendedImage.asset('assets/images/hyerim.jpg'),
                  title: Text('address $index', style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('subtitle $index'),);
              }, itemCount: 10,),
            )
          ],
      ),
    );
  }
}
