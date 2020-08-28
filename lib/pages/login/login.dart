import 'package:flutter/material.dart';
import 'package:login_boilerplate/constants/app_theme.dart';
import 'package:login_boilerplate/pages/login/widgets/login_form.dart';
import 'package:login_boilerplate/pages/login/widgets/novo_cadastro.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 28, right: 28),
        color: Theme.of(context).primaryColor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage('assets/images/logo.png')),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 500,
                  height: 388,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                  child: DefaultTabController(
                    length: 2,
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          TabBar(
                            labelColor: Colors.black,
                            indicatorColor: ThemeColors.secondary,
                            tabs: <Widget>[
                              Tab(
                                text: 'Login',
                              ),
                              Tab(
                                text: 'New Register',
                              )
                            ],
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: Theme(
                                data: ThemeData(
                                    primaryColor: ThemeColors.blueDark),
                                child: TabBarView(
                                  children: <Widget>[
                                    LoginForm(),
                                    NovoCadastroForm()
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
