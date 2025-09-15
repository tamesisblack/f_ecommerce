import 'package:flutter/material.dart';
class Defaulticonback extends StatelessWidget {
  double left;
  double  top;
  Defaulticonback({super.key, required this.left, required this.top});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: top, left: left),
      child: IconButton(onPressed: (){ Navigator.pop(context); }, icon: Icon(Icons.arrow_back, color: Colors.white, size: 35,),)
    );
  }
}