import 'package:flutter/material.dart';
import 'package:login_boilerplate/constants/app_theme.dart';
import 'package:login_boilerplate/pages/menu/menu.dart';
import 'package:login_boilerplate/stores/global/global_store.dart';

import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pagesList;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pagesList = [MenuPage(), MenuPage(), MenuPage()];
    var globalStore = Provider.of<GlobalStore>(context);
    print(globalStore.usuarioNome + ' logged');
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: IndexedStack(
          index: _selectedPage,
          children: pagesList,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (index) => setState(() => _selectedPage = index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: ThemeColors.secondary,
        unselectedItemColor: Color.fromARGB(240, 255, 255, 255),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ac_unit,
            ),
            title: Text('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm_add,
            ),
            title: Text('home2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            title: Text('config'),
          )
        ],
      ),
    );
  }
}
