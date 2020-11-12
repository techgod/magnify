import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:magnify/screens/details.dart';

class VerticalPlaceItem extends StatelessWidget {
  final Map place;
  final Color color;

  VerticalPlaceItem({this.place,this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        child: Container(
          height: 70.0,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  "${place["img"]}",
                  height: 70.0,
                  width: 70.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15.0),
              Container(
                height: 80.0,
                width: MediaQuery.of(context).size.width - 130.0,
                child: ListView(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${place["name"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 13.0,
                          color: Colors.blueGrey[300],
                        ),
                        SizedBox(width: 3.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${place["location"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.blueGrey[300],
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.0),
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
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Details(
                  place,color
                );
              },
            ),
          );
        },
      ),
    );
  }
}
