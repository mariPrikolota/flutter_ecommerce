import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/model.dart';


class Constants {
  static const String HOT_SAlES_API = 'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175';
}

class PhoneApi {
  Future<HotSales> fetchHotSales() async {
    final response = await http.get(Uri.parse(Constants.HOT_SAlES_API));

    if (response.statusCode == 200) {
      return HotSales.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}