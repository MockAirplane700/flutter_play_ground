import 'package:flutter/material.dart';
import 'package:flutter_play_ground/pages/mtha\'s%20world/characters%20page.dart';
import 'package:flutter_play_ground/pages/mtha\'s%20world/home.dart';
import 'package:flutter_play_ground/pages/projects%20page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selected;
  const CustomBottomNavigationBar({Key? key, required this.selected}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Projects',
    ),
    Text(
      'Index 1: Home',
    ),
    Text(
      'Index 2: Characters',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        //projects
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProjectsPage(selectedIndex: 0)));
      }else if (_selectedIndex == 1) {
        //home
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home(selectedIndex: 1)));
      }else{
        //characters
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const CharactersPage(selectedIndex: 2)));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.selected;
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.listCheck),
          label: 'Projects'
        ),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.fingerprint),
            label: 'Characters'
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueAccent,
      onTap: _onItemTapped,
    );
  }
}
