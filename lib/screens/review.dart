import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:magnify/util/const.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  bool c1 = false;
  bool c2 = false;
  bool c3 = false;
  bool c4 = false;

  String city = "New Delhi";

  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Constants.lightPrimary,
        elevation: 2.0,
        centerTitle: true,
        title: Text(
          "Review Place",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xFFC5C5C5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              DropdownButton<String>(
                value: city,
                items: <String>[
                  'New Delhi',
                  'Bangalore',
                  'Mumbai',
                  'Hyderabad',
                  'Lucknow',
                  'Kolkata',
                  'Pune',
                  'Jaipur',
                  'Chennai'
                ].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    city = value;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Who will most likely enjoy this place?",
                style: TextStyle(color: Colors.grey[900]),
              ),
              SizedBox(height: 0.0),
              CheckboxListTile(
                title: Text("Kids"),
                value: c1,
                onChanged: (newValue) {
                  setState(() {
                    c1 = newValue;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("College Students"),
                value: c2,
                onChanged: (newValue) {
                  setState(() {
                    c2 = newValue;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Families"),
                value: c3,
                onChanged: (newValue) {
                  setState(() {
                    c3 = newValue;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Senior Citizens"),
                value: c4,
                onChanged: (newValue) {
                  setState(() {
                    c4 = newValue;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Your Rating",
                    style: TextStyle(fontSize: 16),
                  ),
                  RatingBar(
                    ignoreGestures: false,
                    itemSize: 28,
                    tapOnlyMode: true,
                    allowHalfRating: true,
                    onRatingUpdate: (rating) {},
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Icon(Icons.star),
                      half: Icon(Icons.star_half),
                      empty: Icon(Icons.star_outline),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              buildFeedbackForm(),

              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: RaisedButton(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.brown,
                      padding: EdgeInsets.all(16.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Share your experience at this place..",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Color(0xFFC5C5C5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE5E5E5),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Color(0xFFA6A6A6),
                  ),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFFA5A5A5),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Upload Photos (optional)",
                    style: TextStyle(
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: (){      Navigator.pop(context);},
  );
  Widget continueButton = FlatButton(
    child: Text("Submit"),
    onPressed: () {
      Navigator.pop(context);
            Navigator.pop(context);

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Are you sure you want to submit this review?"),
    content: Text("This review will take a few hours to get processed."),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
