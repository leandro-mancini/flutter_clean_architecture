import 'package:aprove_me/src/app/pages/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class AppDrawer extends View {
  @override
  _AppDrawerState createState() => _AppDrawerState(AppDrawerController());
}

class _AppDrawerState extends ViewState<AppDrawer, AppDrawerController> {
  _AppDrawerState(AppDrawerController controller) : super(controller);

  int _selectedDrawerIndex = 0;

  final drawerItems = [
    new DrawerItem('Registros pendentes', Icons.description),
    new DrawerItem('Meus registros', Icons.history),
    new DrawerItem('Sair', null)
  ];

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);

    switch(index) {
      case 0:
        print('Registros pendentes');
        break;
      case 1:
        print('Meus registros');
        break;
      case 2:
        Navigator.pushNamed(context, '/');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];

    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon, color: Color(0xFFFF6759)),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xFFEAEAEC),
            ),
            accountName: Text(
              'Emmanuel Soares',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF585859),
              ),
            ),
            accountEmail: null,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Color(0xFFEAEAEC)),
              )
            ),
          ),
          Column(
            children: drawerOptions
          ),
        ],
      ),
    );
  }
}