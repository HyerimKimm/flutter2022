import 'package:flutter/material.dart';

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
                ),
            ),
          ],
      ),
    );
  }
}
