import 'package:flutter/material.dart';
import 'package:untitled2/03/card2.dart';
import 'package:untitled2/03/card3.dart';
import 'card1.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TODO: Add state variables and functions
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    // TODO: Replace with Card1
    const Card1(),
    // TODO: Replace with Card2
    const Card2(),
    // TODO: Replace with Card3
    const Card3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich home',
          style: Theme
              .of(context)
              .textTheme
              .headline6,
        ),
      ),
      // TODO: Show selected tab
      body: pages[_selectedIndex],
      // TODO: Add bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme
            .of(context)
            .textSelectionTheme
            .selectionColor,
        // TODO: Set selected tab bar
        // 10
        currentIndex: _selectedIndex,
// 11
        onTap: _onItemTapped,

        //todo: khi sử dụng bottom navigation bar phải có tối thiểu 2 item
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Card'),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard), //todo: add icon
            label: 'Card2', //todo: add label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card3',
          ),
        ],
      ),
    );
  }
}
