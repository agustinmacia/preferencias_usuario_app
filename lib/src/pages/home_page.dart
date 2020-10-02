import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/shared_preferences/preferencias_usuarios.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    
    final preferencias = new PreferenciasUsuario();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias del usuario'),
        backgroundColor: (preferencias.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${preferencias.colorSecundario}'),
          Divider(),
          Text('Genero: ${ preferencias.genero }'),
          Divider(),
          Text('Nombre usuario: ${ preferencias.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}