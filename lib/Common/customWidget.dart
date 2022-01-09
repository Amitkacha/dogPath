import 'package:flutter/cupertino.dart';

class CustomWidget{
  Widget textWidget(String mTxt, double size,Color color) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        mTxt,
        textScaleFactor: 1,
        style: TextStyle(color: color, fontSize: size),
      ),
    );
  }
}