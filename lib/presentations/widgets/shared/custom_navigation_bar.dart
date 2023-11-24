
import 'package:flutter/material.dart';
class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_max), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.label), label: "Categorias"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoritos")
    ],
    elevation: 0,);
  }
}