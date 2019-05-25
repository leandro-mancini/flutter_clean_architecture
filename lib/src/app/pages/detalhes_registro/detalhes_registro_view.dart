import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'detalhes_registro_controller.dart';

class DetalhesRegistro extends View {
  @override
  _DetalhesRegistroState createState() => _DetalhesRegistroState(DetalhesRegistroController());
}

class _DetalhesRegistroState extends ViewState<DetalhesRegistro, DetalhesRegistroController> {
  _DetalhesRegistroState(DetalhesRegistroController controller) : super(controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}