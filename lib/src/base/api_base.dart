import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constant.dart';

class ApiBase {
  Future<dynamic> postLogin(String url, dynamic body) async {
    final response = await http.post(Uri.parse(apiUrl + url), body: body);
    var responseJson = _returnResponse(response);
    return responseJson;
  }

  Future<dynamic> getDataProduk(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(apiUrl + url));
      responseJson = _returnResponse(response);
    } catch (e) {
      print(e.toString());
    }
    return responseJson['data'];
  }
}

_returnResponse(http.Response response) {
  if (response.statusCode == 200) {
    var responseJson = jsonDecode(response.body.toString());
    return responseJson;
  } else {
    var responseJson = jsonDecode(response.body.toString());
    return responseJson;
  }
  // switch (response.statusCode) {
  //   case 200:
  //     var responseJson = jsonDecode(response.body.toString());
  //     return responseJson;

  //   case 400:
  //     var responseError = jsonDecode(response.body.toString());
  //     return responseError["error"];

  //   default:
  //     return Exception('default Error ${response.statusCode.toString()}');
  // }
}
