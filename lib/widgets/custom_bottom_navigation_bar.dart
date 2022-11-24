import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar(this.pageController, this.selectedIndex,  {Key? key}) : super(key: key);

  PageController pageController;
  int selectedIndex;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {

    void onItemTapped(int index){
      setState(() {
        widget.selectedIndex = index;
        widget.pageController.jumpToPage(index);
      });
    }

    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 111, 180, 170),
      currentIndex: widget.selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.shifting,
      unselectedItemColor: Colors.black38,
      selectedItemColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          backgroundColor: Color.fromARGB(255, 111, 180, 170),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_collection_rounded),
          backgroundColor: Color.fromARGB(255, 58, 76, 128),
          label: 'Cursos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail),
          backgroundColor: Color.fromARGB(255, 182, 201, 50),
          label: 'Contrato',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          backgroundColor: Color.fromARGB(255, 87, 87, 87),
          label: 'Usuário',
        ),
      ],
    );
  }
}
