import 'package:flutter/material.dart';
import 'package:magnify/util/cities.dart';
import 'package:magnify/util/const.dart';
import 'package:magnify/util/places.dart';
import 'package:magnify/widgets/city_place_item.dart';

class CityPlaces extends StatelessWidget {
  final String cityName;
  final String cityCode;

  CityPlaces(this.cityName, this.cityCode);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(cities['$cityCode']['color']),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(cities['$cityCode']['color']),
          toolbarHeight: 180,
          title: Column(children: [
            Image.asset('assets/$cityCode.png'),
            Text(cityName),
          ])),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cities['$cityCode']['details'],
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              color: Color(cities['$cityCode']['color']),
            ),
            buildCityList(cityName, cityCode)
          ],
        ),
      ),
    );
  }

  Widget buildCityList(String city, String citycode) {
    print(citycode);
    if (!places.containsKey(citycode)) {
      //value doesn't exist
      //use default bom value
      citycode = 'bom';
    }
    return Container(
      color: Constants.lightPrimary,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Found ${places[citycode].length} places in $city",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView.builder(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: places[citycode] == null ? 0 : places[citycode].length,
              itemBuilder: (BuildContext context, int index) {
                print(places[citycode][index]);
                Map place = places[citycode][index];
                return CityPlaceItem(
                  place: place,
                  citycode: citycode,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
