import 'dart:convert';
import 'package:contact/models/card_model.dart';
import 'package:http/http.dart';


class Network {

  // Base url
  static String BASE_URL = "62345db5debd056201e33fab.mockapi.io";

  // Header
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  // Apis
  static String API_CARDS = "/contact/contact";

  static String apidelete(String id) {
    return "/contact/contact/$id";
  }

  /// Methods

  // get method
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE_URL, api, params);
    Response response = await get(uri, headers: headers);
    print("\nResponse => ${response.body}");
    print("\nUrl => $uri \n");
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // post method
  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE_URL, api);
    Response response = await post(uri, headers: headers, body: jsonEncode(params));
    print("Card create => ${response.body}");
    if (response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  // delete method
  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE_URL, api, params);
    Response response = await delete(uri, headers: headers);
    print("{Url => $uri}");
    print("Delete => ${response}");
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /// Params

    static Map<String, dynamic> paramsCreate(Welcome value) {
    Map<String, dynamic> map = {
      "name": value.name,
      'relative': value.relative,
      'number': value.number,
      'id': value.id,
    };
    return map;
  }

  // static Map<String, dynamic> params() {
  //   Map<String, dynamic> map = {
  //
  //   };
  //   return map;
  // }

  // Params
  static Map<String, dynamic> paramEmpty() {
    Map<String, dynamic> map = {};
    return map;
  }

  /* Http parsing */
  static List <Welcome> parseUsersList(String body) {
    List <Welcome> cards = welcomeFromJson(body);
    return cards;
  }
}