import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:global_med/themes/themes.dart';

// Añade los nuevos parámetros aquí
class MyBottomAppBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomAppBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _MyBottomAppBarState createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildTabItem(
            option1: 'public/assets/navbar/menu1.svg',
            option2: 'public/assets/navbar/menu2.svg',
            text: 'Inicio',
            isSelected: widget.selectedIndex == 0,
            index: 0,
          ),
          _buildTabItem(
            option1: 'public/assets/navbar/car1.svg',
            option2: 'public/assets/navbar/car2.svg',
            text: 'Farmacia',
            isSelected: widget.selectedIndex == 1,
            index: 1,
          ),
          SizedBox(width: 40), // Espacio para el FAB
          _buildTabItem(
            option1: 'public/assets/navbar/cora1.svg',
            option2: 'public/assets/navbar/cora2.svg',
            text: 'Favoritos',
            isSelected: widget.selectedIndex == 2,
            index: 2,
          ),
          _buildTabItem(
            option1: 'public/assets/navbar/agenda1.svg',
            option2: 'public/assets/navbar/agenda2.svg',
            text: 'Agenda',
            isSelected: widget.selectedIndex == 3,
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required String text,
    required String option1,
    required String option2,
    required bool isSelected,
    required int index,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => widget.onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            isSelected ? option2 : option1,
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? tree : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
