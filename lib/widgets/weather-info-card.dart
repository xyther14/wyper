import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherInfoCard extends StatelessWidget {

  WeatherInfoCard({@required this.icon,this.data});

  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(icon,size: 50.0,),
            Text(data,style: TextStyle(fontSize: 32.0,fontFamily: 'Quicksand'),textAlign: TextAlign.center,),
          ],
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.cyan[100],
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}