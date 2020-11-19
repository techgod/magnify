import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magnify/screens/city_places.dart';
import 'package:magnify/util/const.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white54,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 40, 20, 0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/magnify_logo.png',
                    width: 90,
                    height: 90,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("magnify",
                      style: GoogleFonts.signika(
                          fontSize: 50, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 38.0, vertical: 0.0),
                child: Text("choose a city explore",
                    style: GoogleFonts.signika(fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            buildGrid(),
          ],
        ),
      ),
    );
  }
}

Widget buildGrid() {
  double maginspace = 20;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    child: Container(
      color: Constants.lightPrimary,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CityIcon('del', "New Delhi"),
              CityIcon('blr', "Bengaluru"),
              CityIcon('bom', "Mumbai"),
            ],
          ),
          SizedBox(
            height: maginspace,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CityIcon('lko', "Lucknow"),
              CityIcon('jai', "Jaipur"),
              CityIcon('ccu', "Kolkata"),
            ],
          ),
          SizedBox(
            height: maginspace,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CityIcon('maa', "Chennai"),
              CityIcon('pnq', "Pune"),
              CityIcon('hyd', "Hyderabad"),
            ],
          ),
          SizedBox(
            height: maginspace,
          ),
        ],
      ),
    ),
  );
}

class CityIcon extends StatelessWidget {
  final String cityCode;
  final String cityName;
  CityIcon(this.cityCode, this.cityName);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CityPlaces(cityName, cityCode)));

        print("Clicked $cityName");
      },
      child: Container(
        color: Constants.lightPrimary,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(children: [
            Image.asset(
              'assets/cities/$cityCode.png',
              width: 100,
              height: 100,
            ),
            Text(
              cityName,
              style: TextStyle(fontSize: 14),
            )
          ]),
        ),
      ),
    );
  }
}
