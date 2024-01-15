import 'package:tourisme/screens/MyHomePage.dart';
import 'package:tourisme/screens/UserInfoPage.dart';
import 'package:flutter/material.dart';
import 'package:tourisme/screens/SimplePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  HomeBottomBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      //color: Colors.blue, // Couleur de l'élément sélectionné
      //buttonBackgroundColor: Colors.blue, // Couleur du bouton
      height: 50.0,
      items: <Widget>[
        Icon(Icons.person_outline, size: 30),
        Icon(Icons.favorite_outline, size: 30),
        Icon(Icons.home, size: 30, color: Colors.redAccent),
        Icon(Icons.location_on_outlined, size: 30),
        Icon(Icons.list, size: 30),
      ],
      index: 2,
      onTap: (index) {
        onTap(index);
        // Naviguer vers la page correspondante
        navigateToPage(context, index);
      },
    );
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WhatsAppProfile()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SimplePage()));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage()));
        break;
      default:
        break;
    }
  }
}
