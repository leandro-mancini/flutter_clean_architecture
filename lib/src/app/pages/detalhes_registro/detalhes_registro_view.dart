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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 170,
            floating: false,
            pinned: true,
            iconTheme: IconThemeData(
              color: Color(0xFFFF1537)
            ),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  centerTitle: true,
                  title: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Chip(
                        padding: EdgeInsets.only(
                          left: 26,
                          right: 26,
                        ),
                        label: new Text(
                          "Pendente",
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            color: Color(0xFF585859),
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                        ),
                        backgroundColor: Color(0xFFFFF857),
                      ),
                      ),
                      Text(
                        'Solicitação de compra',
                        style: TextStyle(
                          color: Color(0xFF585859),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Nº0000001',
                        style: TextStyle(
                          color: Color(0xFF585859),
                          fontWeight: FontWeight.normal,
                          fontSize: 24,
                          fontFamily: 'Montserrat Regular'
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
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
      ),
    );
  }
}