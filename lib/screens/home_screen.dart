import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/widgets/DestinationCarrousel.dart';
import 'package:flutter_travel_ui_starter/widgets/HotelCarrousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  var currentTab = 0;

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          icons.elementAt(index),
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                "O que você gostaria de encontrar ?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcon(map.key))
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
           DestinationCarrousel(),
            SizedBox(height: 20,),
            HotelCarrousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentTab = index;
          });
        },
        currentIndex: currentTab,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.search, size: 30,),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.local_pizza,size: 30,),
              title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
              icon:CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage("https://yt3.ggpht.com/a-/AOh14Ggi_0IWqR7OGFY5-8rDsOw73j7YTgaVNJAOBb7khw=s88-c-k-c0xffffffff-no-rj-mo"),
              ),
              title: SizedBox.shrink()
          )
        ],
      ),
    );
  }
}
