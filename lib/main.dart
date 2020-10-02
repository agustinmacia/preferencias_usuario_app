import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/pages/home_page.dart';
import 'package:preferencias_usuario_app/src/pages/settings_page.dart';
import 'package:preferencias_usuario_app/src/shared_preferences/preferencias_usuarios.dart';
 
void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  final preferencias = new PreferenciasUsuario();
  await preferencias.initPreferences();
  
  runApp(MyApp());
} 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      }
    );
  }
}