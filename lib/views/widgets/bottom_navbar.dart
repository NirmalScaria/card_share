import 'package:card_share/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final BuildContext context;
  MyBottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.context,
  });
  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
  ];
  void onTap(int index, BuildContext context) {
    if (index == selectedIndex || index >= screens.length) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screens[index],
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
          onTap: (index) => onTap(index, context),
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
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
    );
  }
}
