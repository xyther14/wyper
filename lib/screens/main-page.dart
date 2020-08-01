import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wypernew/const.dart';
import 'package:wypernew/services/weather.dart';
import 'package:wypernew/widgets/bottom-button.dart';
import 'package:geolocator/geolocator.dart';
import '../WyperMessage.dart';
import 'info-page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Position _currentPosition;
  double latitude, longitude;
  bool flag = false;
  String imageIcon = 'images/search-min.gif';
  String wyperMessage = "Professor X can't read your mind. Enter a city.";
  var cityName, bottomName;
  var condition,temp,desc,wind,humidity;
  int randNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var _controller = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Wyper',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w900,fontFamily: 'Quicksand'),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
                    child: IconButton(icon: Icon(Icons.location_on),
                      color: Colors.cyan,
                      onPressed: () async {
                        _getCurrentLocation();
                      _controller.clear();
                        FocusScope.of(context).unfocus();
                        try {
                          WeatherData weatherData = WeatherData(
                              latitude: latitude,longitude: longitude);
                          var data = await weatherData.getGeoData();
                          condition = (data['weather'][0]['main'])
                              .toString()
                              .toLowerCase();
                          cityName = data['name'].toString();
                          bottomName = data['name'].toString();
                          temp = data['main']['temp'].toString();
                          desc = data['weather'][0]['description'].toString();
                          wind = data['wind']['speed'].toString();
                          humidity = data['main']['humidity'].toString();
                          updateMainUI();
                        }catch(e) {
                          setState(() {
                            setState(() {
                              imageIcon = 'images/manhattan-min.gif';
                              flag = false;
                              wyperMessage = 'Please turn on location for Dr. Manhattan to get the details.';
                            });
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextField(
                        controller: _controller,
                        onChanged: (newValue) {
                          cityName = newValue;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter a city name',
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
                    child: IconButton(icon: Icon(Icons.search),
                      color: Colors.cyan,
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        try {
                          WeatherData weatherData = WeatherData(
                              cityName: cityName);
                          var data = await weatherData.getData();
                          condition = (data['weather'][0]['main'])
                              .toString()
                              .toLowerCase();
                          bottomName = data['name'].toString();
                          temp = data['main']['temp'].toString();
                          desc = data['weather'][0]['description'].toString();
                          wind = data['wind']['speed'].toString();
                          humidity = data['main']['humidity'].toString();
                          updateMainUI();
                        }catch(e){
                          setState(() {
                            imageIcon = 'images/manhattan-min.gif';
                            wyperMessage = "Dr. Manhattan is having trouble finding the weather. Check internet connection or the city name.";
                            flag = false;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(imageIcon,),
                  height: screenHeight * 0.4,
                ),
                Container(
                  padding: EdgeInsets.only(top : 10,bottom: 25,left: 4,right: 4),
                  child: Text(wyperMessage, style:normalStyle,textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
          Visibility(
            visible: flag,
            child: Expanded(
              flex: 1,
              child: BottomButton(text: 'See details for $bottomName',onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(temp: temp,desc: desc,wind: wind,humidity: humidity,cityName: cityName,condition: condition,)));
                },),
            ),
          )
        ],
      ),
    );
  }

  void updateMainUI() {
    getRandom();
    setState(() {
      imageIcon = 'images/$condition$randNum-min.gif';
      flag = true;
      wyperMessage = WyperMessage(cityName: cityName,condition: condition.toLowerCase(),number: randNum).wyperMessage();
    });
  }

  void getRandom() {
    randNum = Random().nextInt(2) + 1;
  }

  _getCurrentLocation() async {
    final Geolocator geolocator = Geolocator();
      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium)
          .then((Position position) {
        setState(() {
          _currentPosition = position;
          latitude = _currentPosition.latitude;
          longitude = _currentPosition.longitude;
        });
      }).catchError((e) {
        print(e);
      });
  }
}

