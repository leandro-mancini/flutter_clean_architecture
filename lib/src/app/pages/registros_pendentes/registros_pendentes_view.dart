import 'package:aprove_me/src/app/pages/filtrar/filtrar_view.dart';
import 'package:aprove_me/src/app/pages/registros_pendentes/registros_pendentes_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class RegistrosPendentes extends View {
  @override
  _RegistrosPendentesState createState() => _RegistrosPendentesState(RegistrosPendentesController());
}

class _RegistrosPendentesState extends ViewState<RegistrosPendentes, RegistrosPendentesController> {
  _RegistrosPendentesState(RegistrosPendentesController controller) : super(controller);

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  
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

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Color(0xFFFF1537),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Color(0xFFFF1537),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate()
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            color: Color(0xFFFF1537),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute<DismissDialogAction>(
                builder: (BuildContext context) => FiltrarPage(),
                fullscreenDialog: true,
              ));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFFEAEAEC),
                backgroundImage: NetworkImage("https://www.shareicon.net/data/256x256/2015/09/24/106425_man_512x512.png"),
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
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        'Resultado de busca.',
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}

class CustomLocalizationDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<MaterialLocalizations> load(Locale locale) => SynchronousFuture<MaterialLocalizations>(const CustomLocalization());

  @override
  bool shouldReload(CustomLocalizationDelegate old) => false;

  @override
  String toString() => 'CustomLocalization.delegate(en_US)';
}

class CustomLocalization extends DefaultMaterialLocalizations {
  const CustomLocalization();

  @override
  String get searchFieldLabel => "Pesquisar...";
}
