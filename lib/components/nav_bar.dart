import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stud_portal/screens/dmpage.dart';
import 'package:stud_portal/screens/home.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // create a dark theme
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      selectedIconTheme: IconThemeData(
        color: Colors.deepPurple,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.black12,
      ),

      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.home),
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          label: "DM",
          icon: IconButton(
            icon: Icon(Icons.chat),
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DmPage(),
                ),
              );
            },
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
