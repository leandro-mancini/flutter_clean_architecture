import 'package:aprove_me/src/app/pages/filtrar/filtrar_view.dart';
import 'package:aprove_me/src/app/pages/menu/menu_view.dart';
import 'package:aprove_me/src/app/pages/registros_pendentes/registros_pendentes_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RegistrosPendentes extends View {
  @override
  _RegistrosPendentesState createState() => _RegistrosPendentesState(RegistrosPendentesController());
}

class _RegistrosPendentesState extends ViewState<RegistrosPendentes, RegistrosPendentesController> {
  _RegistrosPendentesState(RegistrosPendentesController controller) : super(controller);

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var topAppBar = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 170,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.menu),
              color: Color(0xFFFF1537),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                topAppBar = constraints.biggest.height;
                return FlexibleSpaceBar(
                  title: Text(
                    'Registros Pendentes',
                    style: TextStyle(
                      color: Color(0xFF585859),
                      fontSize: topAppBar <= 100 ? 20 : 24,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                  titlePadding: EdgeInsets.only(
                    bottom: topAppBar <= 100 ? 17 : 24,
                    left: topAppBar <= 100 ? 70 : 17
                  ),
                );
              },
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
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Conteúdo aqui.'),
                ],
              ),
            ),
          )
        ],
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
