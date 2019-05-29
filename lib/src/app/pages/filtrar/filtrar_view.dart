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

  final List<String> _allActivities = <String>['Pinheiros Dias', 'Praxio Tecnologia', 'Metra', 'Cometa'];
  String _activity = 'Praxio Tecnologia';

  bool tipoA = false;
  bool tipoB = false;
  bool tipoC = false;

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFFFF1537),
          onPressed: () => {
            Navigator.pop(context, DismissDialogAction.cancel)
          },
        ),
        actions: <Widget> [
          FlatButton(
            child: Text(
              'SALVAR',
              style: TextStyle(
                color: Color(0xFFFF1537),
                fontSize: 14,
              ),
            ),
            onPressed: () {
              Navigator.pop(context, DismissDialogAction.save);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 45,
          bottom: 26
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              margin: EdgeInsets.only(
                bottom: 26,
                left: 16,
                right: 16,
              ),
              child: InputDecorator(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  border: OutlineInputBorder(),
                  labelText: 'Empresa',
                  hintText: 'Selecione a Empresa',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  )
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _activity,
                    onChanged: (String newValue) {
                      setState(() {
                        _activity = newValue;
                      });
                    },
                    items: _allActivities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              )
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 26,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Color(0xFFEAEAEC))
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      // bottom: 34,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      'Tipos',
                      style: TextStyle(
                        color: Color(0xFF585859),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10
                    ),
                    child: Column(
                      children: <Widget>[
                        CheckboxListTile(
                          value: tipoA,
                          onChanged: (bool value) { 
                            setState(() {
                              tipoA = value;
                            });
                          },
                          title: new Text('Solicitação de compra'),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFFF6759),
                        ),
                        CheckboxListTile(
                          value: tipoB,
                          onChanged: (bool value) { 
                            setState(() {
                              tipoB = value;
                            });
                          },
                          title: new Text('Solicitação de compra'),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFFF6759),
                        ),
                        CheckboxListTile(
                          value: tipoC,
                          onChanged: (bool value) { 
                            setState(() {
                              tipoC = value;
                            });
                          },
                          title: new Text('Obrigação'),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFFF6759),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}