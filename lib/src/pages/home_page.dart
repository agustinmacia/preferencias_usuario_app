import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias del usuario'),
      ),
      drawer: _crearMenu(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario:'),
          Divider(),
          Text('Genero:'),
          Divider(),
          Text('Nombre usuario:'),
          Divider(),
        ],
      ),
    );
  }

  Drawer _crearMenu(BuildContext context) {
    //Icono de hamburguesa para desplegar menu lateral
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blue),
            title: Text('Inicio'),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue),
            title: Text('Fotos'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('Personas'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Ajustes'),
            onTap: () {
              //Cambiar raiz.
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            }
          ),
        ],
      ),
    );
  }
}