import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

// Find the Scaffold in the widget tree and use it to show a SnackBar.

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
      body: Padding(
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
          TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "City",
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
              height: 20.0,
            ),
            buildFeedbackForm(),
            SizedBox(height: 20.0),
            //buildNumberField(),
            //Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                                  child: RaisedButton(
                    
                    onPressed: () {
                      Navigator.pop(context);
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
