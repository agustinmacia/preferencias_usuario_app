import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  bool _colorSecundario = true;
  int _genero = 1;
  String _nombre = 'Agustin'; 

  TextEditingController _textController;

  @override
  void initState() { 
    super.initState();
      _textController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
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
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: (valor){
              setState(() {
                _genero = valor;
              });
            },
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: (valor){
              setState(() {
                _genero = valor;
              });
            },
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
              onChanged: (valor){},
            ),
          ),
        ],
      )
    );
  }
}