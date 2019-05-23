import 'package:aprove_me/src/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginPage extends View {
  @override
  _LoginPageState createState() => _LoginPageState(LoginController());
}

class _LoginPageState extends ViewState<LoginPage, LoginController> {
  _LoginPageState(LoginController controller) : super(controller);

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
                          color: Color(0xFF6200EE),
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
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF6200EE),
                          width: 2,
                        )
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: Colors.black38,
                        ),
                        onPressed: () {
                          setState(() {
                            // _passwordVisible = !_passwordVisible;  
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
                  height: 40,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: RaisedButton(
                    color: Color(0xFF6200EE),
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
                    onPressed: () => Navigator.pushNamed(context, '/RegistrosPendentes'),
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