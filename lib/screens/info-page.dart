import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wypernew/widgets/bottom-button.dart';
import 'package:wypernew/widgets/weather-info-card.dart';
import '../WyperMessage.dart';
import 'package:weather_icons/weather_icons.dart';


class InfoPage extends StatelessWidget {

  InfoPage({this.temp,this.desc,this.wind,this.humidity,this.cityName,this.condition});

  final String temp;
  final String desc;
  final String wind;
  final String cityName;
  final String humidity;
  final String condition;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:20.0,top: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text('Weather in ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'Quicksand'),),
                  Expanded(child: Text(cityName[0].toUpperCase()+cityName.substring(1),style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w900,color: Colors.cyan,fontFamily: 'Quicksand'),)),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  WeatherInfoCard(icon: WeatherIcons.thermometer,data: temp+'°C',),
                  WeatherInfoCard(icon: WyperMessage(condition: condition).getIcon(),data: desc,),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  WeatherInfoCard(icon: WeatherIcons.humidity,data: humidity+'%',),
                  WeatherInfoCard(icon: WeatherIcons.wind,data: wind+' hPa',),
                ],
              ),
            ),
            Expanded(
              child: BottomButton(text: 'Go Back',onTap: () {Navigator.pop(context);}),),
          ],
        ),
      ),
    );
  }
}
