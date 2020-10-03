import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  //Uso Singleton
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _preferences;

  initPreferences() async{
    this._preferences = await SharedPreferences.getInstance();
  }

  get genero {
    //Uso ?? para hacer la validacion de que no venga vacio y sino el valor por defecto es 1
    return _preferences.getInt('genero') ?? 1;
  }

  set genero(int valor) {
    _preferences.setInt('genero', valor);
  }

  get nombre {
    return _preferences.getString('nombre') ?? 'Agustin';
  }

  set nombre(String valor) {
    _preferences.setString('nombre', valor);
  }

  get colorSecundario {
    return _preferences.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool valor) {
    _preferences.setBool('colorSecundario', valor);
  }

  //Getter & Setter de la ultima pagina

  get ultimaPagina {
    return _preferences.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina (String valor) {
    _preferences.setString('ultimaPagina', valor);
  }

}