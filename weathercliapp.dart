// import 'package:weathercliapp/weathercliapp.dart' as weathercliapp;

import 'weatherapi.dart';

Future<void> main(List<String> arguments) async{
  if (arguments.length != 1) {
    print('Syntax:bin/weathercliapp');
    return;
  }
  final city = arguments.first ;
  final api = Weather();
  final locationId =await api.getInfo(city);
  print(locationId);
}
