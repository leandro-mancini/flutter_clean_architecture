import 'dart:convert';

import 'package:aprove_me/src/domain/entities/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:http/http.dart' as http;

import 'login_view.dart';

class LoginController extends Controller {
  final String baseUrl = "https://aproveme-homologacao.azurewebsites.net/api";

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void lembrarSenha() {
    print('Esqueceu sua senha.');
  }

  String profileToJson(data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }

  String validateField(String value) {
    if (value.length == 0) {
      return 'Campo obrigatório.';
    }

    return null;
  }

  Future<UsuarioRequest> createPost(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;
  
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return UsuarioRequest.fromJson(json.decode(response.body));
    });
  }

  Future submit(_formKey, LoginData data, _scaffoldKey) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      // _scaffoldKey.setState(() {
      //   this.isLoading = true;
      // });

      // state.showSnackBar(SnackBar(content: Text("Teste carregando...")));

      // isLoading = true;

      // var url = 'https://aproveme-homologacao.azurewebsites.net/api/Autenticacao/RequestTokenUI';

      // Map dados = {
      //   'username': '01234567890',
      //   'password': '123'
      // };

      // var body = json.encode(dados);

      // print(isLoading);

      // var response = await http.post(url,
      //   headers: {
      //     "Content-Type": "application/json"
      //   },
      //   body: body
      // );

      // final int statusCode = response.statusCode;

      // if (statusCode < 200 || statusCode > 400 || json == null) {
      //   throw new Exception("Erro ao buscar dados");
      // } else {
      //   print("${response.statusCode}");
      //   print("${response.body}");
      // }

      // Navigator.pushNamed(context, '/Home');
    }
  }

}