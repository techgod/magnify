import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magnify/screens/contribute.dart';
import 'package:magnify/screens/explore.dart';
import 'package:magnify/screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magnify',
      debugShowCheckedModeBanner: false,
      //theme: Constants.lightTheme,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => Home(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  int currentIndex;
  GlobalKey _one = GlobalKey();

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
              child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
                print(currentIndex);
              });
            },
            children: [Explore(), Contribution(), Profile()]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          currentIndex = index;
          pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.rate_review), label: "Contribute"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
