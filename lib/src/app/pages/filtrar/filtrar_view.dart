import 'package:aprove_me/src/app/pages/filtrar/filtrar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

enum DismissDialogAction {
  cancel,
  discard,
  save,
}

class FiltrarPage extends View {
  @override
  _FiltrarPageState createState() => _FiltrarPageState(FiltrarController());
}

class _FiltrarPageState extends ViewState<FiltrarPage, FiltrarController> {
  _FiltrarPageState(FiltrarController controller) : super(controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Filtrar',
          style: TextStyle(
            color: Color(0xFF585859),
            fontSize: 20,
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFFFF1537),
        ),
        actions: <Widget> [
          FlatButton(
            child: Text(
              'Salvar',
              style: TextStyle(
                color: Color(0xFF585859),
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.pop(context, DismissDialogAction.save);
            },
          ),
        ],
      ),
    );
  }
}