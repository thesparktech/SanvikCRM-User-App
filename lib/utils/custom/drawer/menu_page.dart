import 'package:SanvikSystem/utils/custom/drawer/zoom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef void OnClickItem(int index);

class MenuScreen extends StatelessWidget {
  final Widget menu;

  const MenuScreen({Key key, this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        child: menu,
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
