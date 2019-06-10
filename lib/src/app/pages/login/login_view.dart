import 'dart:convert';

import 'package:aprove_me/src/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:http/http.dart' as http;

class LoginData {
  String username = '';
  String password = '';
}

class LoginPage extends View {
  @override
  _LoginPageState createState() => _LoginPageState(LoginController());
}

class _LoginPageState extends ViewState<LoginPage, LoginController> {
  _LoginPageState(LoginController controller) : super(controller);

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _passwordVisible = true;
  bool isLoading = false;

  LoginData data = new LoginData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        heightFactor: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 30,
            bottom: 30,
          ),
          child: Center(
            child: Form(
              key: this._formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset('assets/ic_launcher.png'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF6759),
                            width: 2,
                          )
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'CPF',
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )
                      ),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      validator: controller.validateField,
                      onSaved: (String value) {
                        this.data.username = value;
                      }
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF6759),
                            width: 2,
                          )
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                            color: Colors.black38,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;  
                            });
                          },
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )
                      ),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      validator: controller.validateField,
                      onSaved: (String value) {
                        this.data.password = value;
                      }
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            left: 20
                          ),
                          child: FlatButton(
                            child: Text(
                              'Esqueci minha senha',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                              ),
                            ),
                            onPressed: () => controller.lembrarSenha(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 30,
                          ),
                          height: 40,
                          child: RaisedButton(
                            color: Color(0xFFFF6759),
                            padding: EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40)),
                            child: isLoading ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            ) : Text(
                              'ENTRAR',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            onPressed: () => submit(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: FlatButton(
                            child: Text(
                              'Cadastre-se',
                              style: TextStyle(
                                color: Color(0xFFFF6759),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () => {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  Future submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        this.isLoading = true;
      });

      var url = 'https://aproveme-homologacao.azurewebsites.net/api/Autenticacao/RequestTokenUI';

      Map dados = {
        'username': '01234567890',
        'password': '123'
      };

      var body = json.encode(dados);

      print(isLoading);

      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json"
        },
        body: body
      );

      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Erro ao buscar dados");
      } else {
        print("${response.statusCode}");
        print("${response.body}");
      }

      setState(() {
        this.isLoading = false;
      });

      Navigator.pushNamed(context, '/Home');
    }
  }
}