import 'package:aprove_me/src/domain/entities/produto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'detalhes_registro_controller.dart';

class DetalhesRegistro extends View {
  @override
  _DetalhesRegistroState createState() => _DetalhesRegistroState(DetalhesRegistroController());
}

class _DetalhesRegistroState extends ViewState<DetalhesRegistro, DetalhesRegistroController> {
  _DetalhesRegistroState(DetalhesRegistroController controller) : super(controller);

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var topAppBar = 0.0;
  bool ascending;

  @override
  void initState() {
    super.initState();
    
    ascending = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            iconTheme: IconThemeData(
              color: Color(0xFFFF1537)
            ),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                topAppBar = constraints.biggest.height;

                return FlexibleSpaceBar(
                  centerTitle: true,
                  title: _appBar()
                );
              },
            )
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    _informacao(),
                    _produtos(),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar()
    );
  }

  Widget _appBar() => Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      topAppBar >= 120 ? Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color(0xFFFFF857),
        ),
        margin: EdgeInsets.only(
          bottom: 10,
          top: 15,
        ),
        padding: EdgeInsets.only(
          left: 26,
          right: 26,
          top: 4,
          bottom: 4,
        ),
        child: Text(
          'Pendente',
          style: TextStyle(
            color: Color(0xFF585859),
            fontWeight: FontWeight.normal,
            fontSize: 12,
            fontFamily: 'Montserrat Regular',
          ),
        ),
      ) : new Container(),
      topAppBar >= 90 ? Text(
        'Solicitação de compra',
        style: TextStyle(
          color: Color(0xFF585859),
          fontWeight: FontWeight.normal,
          fontFamily: 'Montserrat Regular',
          fontSize: 12,
        ),
      ) : new Container(),
      Text(
        'Nº0000002',
        style: TextStyle(
          color: Color(0xFF585859),
          fontWeight: FontWeight.normal,
          fontFamily: 'Montserrat Regular'
        ),
      ),
    ],
  );

  Widget _produtos() => Container(
    child: Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              bottom: 16,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFEAEAEC),
                  width: 1,
                )
              )
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Fornecedor ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black38,
                      fontSize: 14,
                      fontFamily: 'Montserrat Regular',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'MICHELLIN',
                        style: TextStyle(
                          color: Color(0xFF292E33),
                          fontWeight: FontWeight.normal
                        ),
                      )
                    ]
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Descrição ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black38,
                      fontSize: 14,
                      fontFamily: 'Montserrat Regular',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Compra com urgência',
                        style: TextStyle(
                          color: Color(0xFF292E33),
                          fontWeight: FontWeight.normal
                        ),
                      )
                    ]
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Obs. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black38,
                      fontSize: 14,
                      fontFamily: 'Montserrat Regular',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'O carro está parado.',
                        style: TextStyle(
                          color: Color(0xFF292E33),
                          fontWeight: FontWeight.normal
                        ),
                      )
                    ]
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              // width: MediaQuery.of(context).size.width * 1.4,
              child: _bodyData(),
            ),
          )
          // Container(
          //   child: _bodyData(),
          // ),
        ],
      ),
    ),
  );

  Widget _informacao() => Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 5,
          bottom: 5,
        ),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16)
          ),
          color: Color(0xFFEAEAEC),
        ),
        child: new Text(
          '11 JAN',
          style: TextStyle(
            fontFamily: 'Montserrat Regular',
            color: Color(0xFF585859),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          bottom: 8,
          top: 13,
          left: 10,
          right: 10,
        ),
        child: Text(
          'Expresso Duque de caxias'.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF292E33),
            fontSize: 16,
            fontFamily: 'Montserrat Regular',
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Requisitante ',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 14,
                fontFamily: 'Montserrat Regular',
                fontWeight: FontWeight.w600
              ),
            ),
            Text(
              'Bruno Ribeiro',
              style: TextStyle(
                color: Color(0xFF292E33),
                fontSize: 14,
                fontFamily: 'Montserrat Regular',
                fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color(0xFFFFF857),
        ),
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          top: 6,
          bottom: 6,
        ),
        margin: EdgeInsets.only(
          top: 8,
          bottom: 8
        ),
        child: RichText(
          text: TextSpan(
            text: 'Total ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF292E33),
              fontSize: 14,
              fontFamily: 'Montserrat Regular',
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'R\$ 16.500,00',
                style: TextStyle(
                  fontWeight: FontWeight.normal
                ),
              )
            ]
          ),
        ),
      ),
    ],
  );

  Widget _bottomNavigationBar() => BottomAppBar(
    elevation: 16,
    child: Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              right: 32
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    bottom: 4,
                  ),
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 2,
                      color: Color(0xFFEAEAEC),
                    )
                  ),
                  child: IconButton(
                    color: Color(0xFFFF6759),
                    icon: Icon(Icons.thumb_down),
                    onPressed: () {},
                  ),
                ),
                Text(
                  'Reprovar',
                  style: TextStyle(
                    color: Color(0xFF585859),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 32
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    bottom: 4,
                  ),
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 2,
                      color: Color(0xFFEAEAEC),
                    )
                  ),
                  child: IconButton(
                    color: Color(0xFF22E6A1),
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {},
                  ),
                ),
                Text(
                  'Aprovar',
                  style: TextStyle(
                    color: Color(0xFF585859),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _bodyData() => DataTable(
    sortAscending: ascending,
    sortColumnIndex: 0,
    columns: <DataColumn>[
      DataColumn(
        label: Text('Itens')
      ),
      DataColumn(
        label: Text('Unid.'),
      ),
      DataColumn(
        label: Text('R\$'),
      ),
    ],
    rows: produtos.map((Produto produto) => DataRow(
      cells: [
        DataCell(Text('${produto.item}')),
        DataCell(Text('${produto.unidade}')),
        DataCell(Text('${produto.valor}')),
      ]
    )).toList(),
  );

  void onSortColumn({int columnIndex, bool ascending}) {
    if (columnIndex == 0) {
      setState(() {
        if (ascending) {
          produtos.sort((a, b) => a.item.compareTo(b.item));
        } else {
          produtos.sort((a, b) => b.item.compareTo(a.item));
        }
        this.ascending = ascending;
      });
    }
  }

  void onSelectedRowChanged({bool selected, Produto produto}) {
    print(selected);
    print(produto);
  }
}

var produtos = <Produto>[
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
  Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
  Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
  Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
	Produto(item: 'Lâmpada Fluorescente', unidade: '100.000', valor: 250),
];