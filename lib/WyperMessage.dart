import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WyperMessage {

  WyperMessage({this.cityName,this.number,this.condition});

  int number;
  String cityName;
  String condition;


  String wyperMessage() {
    cityName = cityName[0].toUpperCase()+cityName.substring(1);
    if(condition=='rain' && number==1)
      return "It's raining fishes in $cityName.";
    else if(condition=='rain' && number==2)
      return "Charmander needs to protect itself from rain. You should too.";
    else if(condition=='thunderstorm' && number==1)
      return "SHAZAM! But you probably don't want to get struck by lightning.";
    else if(condition=='thunderstorm' && number==2)
      return "Storm is angry because there's a thunderstorm in $cityName.";
    else if(condition=='haze'&& number==1)
      return "Turn on your spidy senses! Mysterio is hiding in haze.";
    else if(condition=='haze' && number==2)
      return "Rorschach is having trouble seeing in this haze.";
    else if(condition=='smoke' && number==1)
      return "There's smoke in $cityName.";
    else if(condition=='smoke' && number==2)
      return "There's smoke in $cityName. Bane has his masks on!";
    else if(condition=='snow')
      return "Winter is coming!";
    else if (condition=='fog' && number==1)
      return "Even Harry can't find the Snitch in this fog.";
    else if (condition=='fog' && number==2)
      return "Koffing used smoke in $cityName. It was super effective!";
    else if(condition=='ash')
      return "There's ash in $cityName.";
    else if(condition=='clear' && number==1)
      return "It's a clear day in $cityName to go outside.";
    else if(condition=='clear' && number==2)
      return "The Avengers are enjoying as it's clear outside.";
    else if(condition=='clouds')
      return "Clouds won't stop you from flying in $cityName.";
    else if(condition=='drizzle')
      return "It's drizzling in $cityName.";
    else if(condition=='sand' && number==1)
      return "Sandman is in town.";
    else if(condition=='sand' && number==2)
      return "Thanos turned everything to sand in $cityName.";
    else if(condition=='dust' && number==1)
      return "There's dust outside in $cityName.";
    else if(condition=='dust' && number==2)
      return "Thanos turned everything to dust in $cityName.";
    else if(condition=='mist' && number==1)
      return "Baby Yoda is enjoying the mist in $cityName.";
    else if(condition=='mist' && number==2)
      return "Bulbasaur loves when there's mist in $cityName.";

  }

  IconData getIcon() {
    if(condition=='thunderstorm')
      return WeatherIcons.thunderstorm;
    else if(condition=='drizzle')
      return WeatherIcons.raindrops;
    else if(condition=='rain')
      return WeatherIcons.rain_mix;
    else if(condition=='snow')
      return WeatherIcons.snow;
    else if(condition=='mist')
      return WeatherIcons.raindrop;
    else if(condition=='smoke')
      return WeatherIcons.smoke;
    else if(condition=='haze')
      return WeatherIcons.day_haze;
    else if(condition=='fog')
      return WeatherIcons.fog;
    else if(condition=='dust')
      return WeatherIcons.dust;
    else if(condition=='sand')
      return WeatherIcons.sandstorm;
    else if(condition=='ash')
      return WeatherIcons.fire;
    else if(condition=='tornado')
      return WeatherIcons.tornado;
    else if(condition=='clear')
      return WeatherIcons.night_clear;
    else if(condition=='clouds')
      return WeatherIcons.cloudy_windy;
    else
      return WeatherIcons.sunrise;

  }


}