import 'package:flutter/material.dart';
import 'package:restaurant_app/views/home_view.dart';

class BottonNavigatorWidget extends StatefulWidget {
  const BottonNavigatorWidget({super.key});

  @override
  State<BottonNavigatorWidget> createState() => _BottonNavigatorWidgetState();
}

class _BottonNavigatorWidgetState extends State<BottonNavigatorWidget> {
  int curentIndex = 0;
  List<Widget> _children = [
    HomeView(),
    Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
    ),
    Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.pink,
      ),
    ),
    Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
    ),
    Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
      ),
    ),
  ];
  _onTap(int index) {
    setState(() {
      curentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[curentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: curentIndex,
        selectedItemColor: Colors.red, //ຖ້າຖືກເລືອກສະແດງສີແດງ
        unselectedItemColor: Colors.green, //ຖ້າບໍ່ຖືກເລືອກສະແດງສີຂຽວ
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
