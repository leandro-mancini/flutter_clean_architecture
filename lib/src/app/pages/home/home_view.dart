import 'package:aprove_me/src/app/pages/detalhes_registro/detalhes_registro_view.dart';
import 'package:aprove_me/src/app/pages/home/home_controller.dart';
import 'package:aprove_me/src/app/pages/registros_pendentes/registros_pendentes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends View {
  @override
  _HomePageState createState() => _HomePageState(HomeController());
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState(HomeController controller) : super(controller);

  int _selectedDrawerIndex = 0;

  final drawerItems = [
    new DrawerItem('Registros pendentes', Icons.description),
    new DrawerItem('Meus registros', Icons.history)
  ];

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new RegistrosPendentes();
      case 1:
        return new DetalhesRegistro();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    drawerOptions.add(
      new ListTile(
        leading: new Icon(null),
        title: new Text('Sair'),
        onTap: () => Navigator.popUntil(context, ModalRoute.withName('/')),
      )
    );

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: Drawer(
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
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}