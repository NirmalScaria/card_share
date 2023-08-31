import 'package:card_share/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyRouter extends StatefulWidget {
  const MyRouter({super.key});

  @override
  State<MyRouter> createState() => _MyRouterState();
}

class _MyRouterState extends State<MyRouter> {
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              onTap: (value) {
                if (value < screens.length) {
                  setState(() {
                    selectedIndex = value;
                  });
                }
              },
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.secondary,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "lib/assets/icons/home.svg",
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("lib/assets/icons/search_card.svg"),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("lib/assets/icons/manage_card.svg"),
                  label: "Manage",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("lib/assets/icons/profile.svg"),
                  label: "Profile",
                ),
              ]),
        ));
  }
}
