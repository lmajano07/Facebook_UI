import 'package:flutter/material.dart';

import 'package:facebook_ui/data/data.dart';
import 'package:facebook_ui/screens/screens.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}
class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    Icons.account_circle_outlined,
    Icons.groups_outlined,
    FontAwesomeIcons.bell,
    Icons.menu
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context) 
            ? PreferredSize(
              preferredSize: Size(screenSize.width, 100.0),
              child: CustomAppBar(
                currentUser: currentUser,
                icons: _icons,
                selectedIndex: _selectedIndex,
                onTap: (index) => setState(() => _selectedIndex = index)
              ),
            ) 
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens
        ),
        bottomNavigationBar: !Responsive.isDesktop(context) ? Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          color: Colors.white,
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index)
          ),
        )
        : const SizedBox.shrink()        
      )
    );
  }
}