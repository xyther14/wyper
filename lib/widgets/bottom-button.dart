import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

  BottomButton({this.text,this.onTap});

  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.cyan[500],),
        child: Center(child: Text(text,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w700,fontFamily: 'Quicksand'),),),
        margin: EdgeInsets.only(top:10.0),
        width:double.infinity,
      ),
    );
  }
}