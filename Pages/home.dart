import 'package:flutter/material.dart';
import 'package:fast_money/Pages/settings.dart';
import 'package:fast_money/Pages/analytics.dart';
import 'package:fast_money/Pages/start_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentPage = 0;

  final List<Widget> pages = [
    Start(),
    Analytics(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: pages[currentPage],
        backgroundColor: Color(0xfa0a0a0a),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTapped,
          currentIndex: currentPage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.analytics_outlined),
                label: 'Analytics'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_applications_outlined),
                label: 'Settings'
            )
          ],
        ),
      ),
    );
  }

  void onTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }
}

