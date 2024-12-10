import 'package:eco/pages/Perfil.dart';
import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex; // Índice atual da barra
  final Function(int) onTabSelected; // Callback para mudanças

  const CustomNavbar({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 4) { 
          Navigator.pushReplacementNamed(context, '/Downloads');
        } else if (index == 3) { 
          Navigator.pushReplacementNamed(context, '/Selecaoperfil');
        } else if (index == 2) { 
          Navigator.pushReplacementNamed(context, '/Catalogo');
        } else if (index == 0){
          Navigator.pushReplacementNamed(context, '/Pesquisa');
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/Perfil');
        } else {
          onTabSelected(index); 
        }
      },
      selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
      backgroundColor: const Color.fromARGB(255, 101, 220, 101),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Transform.scale(
            scale: 1.2,
            child: Image.asset(
              'assets/iconebar/search-normal.png',
              height: 24,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Transform.scale(
            scale: 1.2,
            child: Image.asset(
              'assets/iconebar/profile.png',
              height: 24,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Transform.scale(
            scale: 1.2,
            child: Image.asset(
              'assets/iconebar/home-2.png',
              height: 24,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Transform.scale(
            scale: 1.2,
            child: Image.asset(
              'assets/iconebar/profile-2user.png',
              height: 24,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Transform.scale(
            scale: 1.5,
            child: Image.asset(
              'assets/iconebar/Import_light.png',
              height: 24,
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
