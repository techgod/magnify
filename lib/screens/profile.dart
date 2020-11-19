import 'package:flutter/material.dart';
import 'package:magnify/screens/login.dart';
import 'package:magnify/screens/support.dart';
import 'package:magnify/widgets/profile_card_item.dart';
import 'package:magnify/widgets/profile_top_half.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: FloatingActionButton(
          child: Icon(Icons.support_agent_outlined),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Support();
                },
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfileTopHalf(),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                },
                child: Text("LOG OUT"),
                color: Colors.brown,
                textColor: Colors.white,
              ),
            ),
            ProfileStatsCard(
              title: "August 2020",
              subtitle: "Joined Magnify",
              iconData: Icons.timeline_rounded,
            ),
            ProfileStatsCard(
              title: "4",
              subtitle: "Cities Explored",
              iconData: Icons.location_city,
            ),
            ProfileStatsCard(
              title: "12",
              subtitle: "Places Explored",
              iconData: Icons.place,
            ),
            ProfileStatsCard(
              title: "3",
              subtitle: "Contributions",
              iconData: Icons.rate_review,
            ),
          ],
        ),
      ),
    );
  }
}
