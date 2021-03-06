import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:magnify/util/cities.dart';
import 'package:magnify/util/places.dart';

class Details extends StatelessWidget {
  final Map place;
  final String citycode;

  Details(this.place, this.citycode);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(cities['$citycode']['color']),
        
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          buildSlider(),
          SizedBox(height: 20),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${place["name"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 14,
                    color: Colors.blueGrey[300],
                  ),
                  SizedBox(width: 3),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${place["location"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blueGrey[300],
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                  alignment: Alignment.centerLeft,
                  child: RatingBar(
                    ignoreGestures: true,
                    itemSize: 15,
                    tapOnlyMode: true,
                    allowHalfRating: true,
                    initialRating: double.parse(place['price']),
                    onRatingUpdate: (rating) {},
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Icon(Icons.star),
                      half: Icon(Icons.star_half),
                      empty: Icon(Icons.star_outline),
                    ),
                  )),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${place["details"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     Icons.airplanemode_active,
      //   ),
      //   onPressed: () {},
      // ),
    );
  }

    buildSlider() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: place['img'] == null ? 0 : place['img'].length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "${place["img"][index]}",
                height: 250.0,
                width: MediaQuery.of(context).size.width - 40.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  // buildSlider() {
  //   return Container(
  //     padding: EdgeInsets.only(left: 20),
  //     height: 250.0,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       primary: false,
  //       itemCount: places == null ? 0 : places.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         Map place = places[citycode][index];

  //         return Padding(
  //           padding: EdgeInsets.only(right: 10.0),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(10.0),
  //             child: Image.asset(
  //               "${place["img"][0]}",
  //               height: 250.0,
  //               width: MediaQuery.of(context).size.width - 40.0,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
