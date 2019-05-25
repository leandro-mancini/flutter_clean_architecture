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

  List items = getDummyList();

  static List getDummyList(){
   List list =  List.generate(10, (i) {
    return "Item ${i +1 }";
    });
    return list;
  }

  void _handleArchive() {
    print('ARQUIVO');
  }

  void _handleDelete() {
    print('REMOVER');
  }

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
                      fontSize: topAppBar <= 120 ? 18 : 20,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                  titlePadding: EdgeInsets.only(
                    bottom: topAppBar <= 120 ? 17 : 24,
                    left: topAppBar <= 120 ? 70 : 17
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
          SliverList(
            delegate: SliverChildListDelegate(
              List<Widget>.generate(items.length, (index) {
                return Dismissible(
                  key: Key(items[index]),
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart)
                      _handleArchive();
                    else
                      _handleDelete();

                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  background: new Container (
                    color: Color(0xFFFF6759),
                    padding: new EdgeInsets.all(15),
                    child: new Row(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.thumb_down, 
                              color: Colors.white, 
                              size: 24
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Reprovar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Color(0xFF22E6A1),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_up, 
                                color: Colors.white, 
                                size: 24
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Aprovar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => print('CLICOU'),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFEAEAEC),
                            width: 1,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.only(
                        bottom: 16,
                        top: 16,
                      ),
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Expresso Duque de caxias'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF292E33),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 4, top: 4),
                            child: Text(
                              'Pedido de compra',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF585859)
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'nº 0000012 . 16.500,00',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF585859)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
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
