import 'dart:convert';

import 'package:http/http.dart' as http;

Future populerNews(String api) async {
  var res = await http.get(api);
  var jsonData = json.decode(res.body);

  return jsonData;
}
