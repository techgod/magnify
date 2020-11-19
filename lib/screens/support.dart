import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magnify/util/const.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Support",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Constants.lightPrimary,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0.0),
                child: Text("FAQ", style: GoogleFonts.signika(fontSize: 38)),
              ),
            ),
            SizedBox(height: 10),
            faqQuestion(
                "Is Magnify Free?", "Yes! Magnify is totally free to use!"),
            faqQuestion("How does Magnify recommend me places?",
                "Magnify recommends places based on your interest."),
            faqQuestion("Can I contribute to Magnify?",
                "Absolutely! You can write your review in the contribute section."),
            faqQuestion("Is Magnify available outside India?",
                "No, currently we only service places in India."),
            faqQuestion("Why is the app called Magnify?",
                "We take pride in 'Magnifying' lesser known places."),
            SizedBox(
              height: 45,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                child: Text("Have more questions?",
                    style: GoogleFonts.signika(fontSize: 24)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              child: Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.brown,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "1800 405 1010",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.brown,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "support@magnify.com",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget faqQuestion(String question, String answer) {
  return Card(
    borderOnForeground: true,
    child: ExpansionTile(
      expandedAlignment: Alignment.centerLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: Text(question),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(answer),
        ),
      ],
    ),
  );
}
