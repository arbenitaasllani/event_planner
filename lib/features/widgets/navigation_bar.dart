import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index) onItemTapped;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xffffffff),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: widget.selectedIndex == 0
                ? Image.asset(
                    width: 30,
                    height: 30,
                    "assets/icons/home_selected_icon.png",
                    // color: Color(0xffCBCFD6),
                  )
                : Image.asset(
                    width: 30,
                    height: 30,
                    "assets/icons/home_icon.png",
                    color: Color(0xff9DA4AB),
                  ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: widget.selectedIndex == 1
                ? Image.asset(
                    width: 30,
                    height: 30,
                    "assets/icons/ticket_selected.png",
                    // color: Color(0xffCBCFD6),
                  )
                : Image.asset(
                    width: 30,
                    height: 30,
                    "assets/icons/ticket_icon.png",
                    color: Color(0xff9DA4AB)),
            label: "My ticket"),
        BottomNavigationBarItem(
            icon: widget.selectedIndex == 2
                ? Image.asset(
                    width: 30,
                    height: 30,
                    "assets/icons/favorite_selected.png",
                    // color: Color(0xffCBCFD6),
                  )
                : Image.asset(
                    width: 30,
                    height: 30,
                    "assets/icons/favorite_icon.png",
                    color: Color(0xff9DA4AB)),
            label: "Favorite"),
        BottomNavigationBarItem(
            icon: widget.selectedIndex == 3
                ? Image.asset(
                    width: 30,
                    height: 30,
                    "assets/icons/message_selected.png",
                    // color: Color(0xffCBCFD6),
                  )
                : Image.asset(
                    width: 30,
                    height: 30,
                    "assets/icons/message_icon.png",
                    color: Color(0xff9DA4AB)),
            label: "Message"),
        BottomNavigationBarItem(
            icon: widget.selectedIndex == 4
                ? Image.asset(
                    width: 30,
                    height: 30,
                    "assets/icons/profile_selected.png",
                    // color: Color(0xffCBCFD6),
                  )
                : Image.asset(
                    width: 30,
                    height: 30,
                    "assets/icons/profile_icon.png",
                    color: Color(0xff9DA4AB)),
            label: "Profile"),
      ],
      selectedItemColor: const Color(0xffF45D43),
      unselectedItemColor: const Color(0xff9DA4AB),
      unselectedLabelStyle: const TextStyle(color: Color(0xff9DA4AB)),
      selectedLabelStyle: const TextStyle(color: Color(0xffF45D43)),
    );
  }
}
