import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:magnify/util/custom_clipper.dart';

class StackContainer extends StatelessWidget {
  const StackContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Stack(
        children: <Widget>[
          Container(),
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/200"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProfileAvatar(
                  "https://www.mantruckandbus.com/fileadmin/_processed_/2/c/csm_kleiss-interview-header_a20023f914.jpg",
                  borderWidth: 4.0,
                  radius: 60.0,
                ),
                SizedBox(height: 4.0),
                Text(
                  "Johnny Appleseed",
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Traveler, Explorer",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
