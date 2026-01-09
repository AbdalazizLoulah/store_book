import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/features/home/view/home_screen.dart';
import 'package:store_book/features/profile/view/profile_scree.dart';
import 'package:store_book/features/wish_list/view/wish_list.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key,});
  
  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      WishList(),
      Container(color: Colors.blue),
      ProfileScreen(
      ),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
      backgroundColor: const Color(0xffF9F9F9),
      body: screens[currentIndex],
    );
  }
}
