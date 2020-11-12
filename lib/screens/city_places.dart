import 'package:flutter/material.dart';
import 'package:magnify/util/cities.dart';
import 'package:magnify/util/places.dart';
import 'package:magnify/widgets/vertical_place_item.dart';

class CityPlaces extends StatelessWidget {
  final String city;
  final String citycode;
  final String blr_desc =
      "Bangalore, officially known as Bengaluru, is the capital of the Indian state of Karnataka. It has a population of more than 8 million and a metropolitan population of around 11 million, making it the third most populous city and fifth most populous urban agglomeration in India. Bangalore is known for its pleasant climate throughout the year. Its elevation is the highest among the major cities of India.";

  CityPlaces(this.city, this.citycode);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(cities['$citycode']['color']),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(cities['$citycode']['color']),
          toolbarHeight: 180,
          title: Column(children: [
            Image.asset('assets/$citycode.png'),
            Text(city),
          ])),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cities['$citycode']['details'],
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              color: Color(cities['$citycode']['color']),
            ),
            buildVerticalList(city)
          ],
        ),
      ),
    );
  }

buildVerticalList(String city) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Found 6 places in $city",
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
            itemCount: places == null ? 0 : places.length,
            itemBuilder: (BuildContext context, int index) {
              Map place = places[index];
              return VerticalPlaceItem(place: place,color: Color(cities['$citycode']['color']),);
            },
          ),
        ),
      ],
    ),
  );
}

}


