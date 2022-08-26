import 'dart:convert';

import 'package:http/http.dart' show get;

import 'weatherr.dart';

class Weather {
  static const key = 'ib63sYDv0jcP0K3eUWpnwwNUwS3bwc6S';

  Future getCity(String city) async {
    final resourceUrl =
        'http://dataservice.accuweather.com/locations/v1/cities/search';
    final query = '?apikey=$key&q=$city';
    final baseUrl = resourceUrl + query;
    final fetchData = Uri.parse(baseUrl);
    final response = await get(fetchData);
    if (response.statusCode != 200) {
      throw Exception('Error getting location ID $city');
    }
    final cityJson = jsonDecode(response.body);
    return cityJson[0]['Key'];
  }

  Future<Weatherr> getWeather(locationId) async {
    final url ='http://dataservice.accuweather.com/locations/v1/cities/search';

    final query = '?apikey=$key&q=$locationId';
    final fetchData = Uri.parse(url + query);
    final response = await get(fetchData);
    print(response.body);
    final weatherjson = jsonDecode(response.body);
    return Weatherr.fromJson(weatherjson);
  }

  Future getInfo(String city) async {
    final location = await getCity(city);
    return getWeather(location);
  }
}
