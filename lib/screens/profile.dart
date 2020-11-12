import 'package:flutter/material.dart';
import 'package:magnify/widgets/card_item.dart';
import 'package:magnify/widgets/stack_container.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          StackContainer(),
          SizedBox(height: 16,),
          CardItem(title: "August 2020",subtitle: "Joined Magnify",iconData: Icons.timeline_rounded,),
          CardItem(title: "4",subtitle: "Cities Visited",iconData: Icons.location_city,),
          CardItem(title: "12",subtitle: "Places Visited",iconData: Icons.place,),
          CardItem(title: "3",subtitle: "Contributions",iconData: Icons.rate_review,),
        ],
      ),
    );
  }
}
