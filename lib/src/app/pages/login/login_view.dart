import 'package:aprove_me/src/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginPage extends View {
  @override
  _LoginPageState createState() => _LoginPageState(LoginController());
}

class _LoginPageState extends ViewState<LoginPage, LoginController> {
  _LoginPageState(LoginController controller) : super(controller);

  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 30,
            bottom: 30,
          ),
          child: Center(
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
                  height: 48,
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
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
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 48,
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
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
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () => {},
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
                          child: Text(
                            'ENTRAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () => Navigator.pushNamed(context, '/Home'),
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
          )
        ),
      )
    );
  }
}