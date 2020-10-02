import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/shared_preferences/preferencias_usuarios.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  bool _colorSecundario;
  int _genero;
  String _nombre = 'Agustin'; 

  TextEditingController _textController;

  final preferencias = new PreferenciasUsuario();

  @override
  void initState() { 
    super.initState();

    _genero = preferencias.genero;
    _colorSecundario = preferencias.colorSecundario;


    _textController = new TextEditingController(text: _nombre);
  }

  // loadPreferences() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();

  //   _genero = preferences.getInt('genero');
  //   setState(() {});
  // }

    _setSelectedGenero(int valor) {
      
      //preferences.setInt('genero', valor);
      preferencias.genero = valor;

      setState(() {
        _genero = valor;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (preferencias.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Ajustes', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color Secundario'),
            onChanged: (valor){
              setState(() {
                _colorSecundario = valor;
                preferencias.colorSecundario = valor;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedGenero,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedGenero,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono'
              ),
              onChanged: (valor){
                preferencias.nombre = valor;
              },
            ),
          ),
        ],
      )
    );
  }
}