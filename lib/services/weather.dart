import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const String url = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = *your OpenWeatherApi key here*;

class WeatherData {

  WeatherData({this.cityName,this.longitude,this.latitude});

  final String cityName;
  final double longitude, latitude;

  Future getData() async {
    http.Response response = await http.get('$url?q=$cityName&appid=$apiKey&units=metric');
    if(response.statusCode==200) {
      String data = response.body;
      return jsonDecode(data);
    }else {
      print(response.statusCode);
    }

  }

  Future getGeoData() async {
    String lat = latitude.toString();
    String long = longitude.toString();
    http.Response response = await http.get('$url?lat=$lat&lon=$long&appid=$apiKey&units=metric');
    if(response.statusCode==200){
      String data = response.body;
      return jsonDecode(data);
    }else{
      print(response.statusCode);
    }
  }

}
