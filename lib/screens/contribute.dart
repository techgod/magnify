import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magnify/screens/review.dart';
import 'package:magnify/util/const.dart';
import 'package:magnify/util/places.dart';
import 'package:magnify/widgets/city_place_item.dart';

class Contribution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 38.0, vertical: 0.0),
                child: Text("your reviews",
                    style: GoogleFonts.signika(fontSize: 38)),
              ),
            ),
            buildExistingReviewsList()
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          child: Icon(Icons.rate_review),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Review();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

buildExistingReviewsList() {
  return Container(
    color: Constants.lightPrimary,
    child: Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView.builder(
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: places == null ? 0 : 3,
            itemBuilder: (BuildContext context, int index) {
              Map place = places['bom'][index];
              return CityPlaceItem(place: place, citycode: 'bom',);
            },
          ),
        ),
      ],
    ),
  );
}
