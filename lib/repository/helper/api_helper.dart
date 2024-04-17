import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../app_config/app_config.dart';

class ApiHelper {
  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    if (access != null) {
      return {'Content-Type': 'application/json', 'Authorization': 'Bearer $access'};
    } else if (dbName != null) {
      return {'Content-Type': 'application/json', 'dbName': dbName};
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }

  static Map<String, String> getApiHeaderForException({String? access, String? dbName}) {
    if (access != null) {
      return {
        // 'Content-Type': 'application/json',
        'Accept': '/',
        'Authorization': 'Bearer $access'
      };
    } else if (dbName != null) {
      return {
        // 'Content-Type': 'application/json',
        'dbName': dbName
      };
    } else {
      return {
        // 'Content-Type': 'application/json',
      };
    }
  }

  // get method
  static getData({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("ApiHelper>getData");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    try {
      log("$url");
      var response = await http.get(url, headers: header);
      log("ApiHelper>>Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        log(decodedData.toString());
        return decodedData;
      } else {
        log("ApiHelper >> Else Condition >> Api failed");
        var decodedData = jsonDecode(response.body);
        return decodedData;
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }

  static getDataWithoutStatus({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("ApiHelper>getData>in>>>Api Helper");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    try {
      log("$url");
      var response = await http.get(url, headers: header);
      log("ApiHelper>>Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        log(">>>>>>ApiHelper>>>>>>${decodedData.toString()}");
        var data = {
          "status": 1,
          "data": decodedData,
        };
        return data;
      } else {
        log("ApiHelper >> Else Condition >> Api failed");
        var data = {
          "status": 0,
          "data": null,
        };
        return data;
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }

  static getDataWithoutStatus1({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("ApiHelper>getData>in>>>Api Helper");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    try {
      log("$url");
      var response = await http.get(url, headers: header);
      log("ApiHelper>getDatawithoutsstatus1>>Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        log(">>>>>>ApiHelper>>>>>>${decodedData.toString()}<<<<<<<<<<<<Api helper111");
        var data = {
          "status": 1,
          "followers": decodedData,
        };
        return data;
      } else {
        log("ApiHelper >> Else Condition >> Api failed");
        var data = {
          "status": 0,
          "followers": null,
        };
        return data;
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }

  static postData({
    required String endPoint,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    log("Api-helper -> postData");
    log("$body");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("header=$header");
    log("$url");
    try {
      var response = await http.post(url, body: body, headers: header);
      log("ApiHelper>>Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200||response.statusCode == 201) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else {
        log("Else Condition -> Api failed");
        var decodedData = jsonDecode(response.body);
        var data = {"status": 0, "msg": "Failed", "data": decodedData};
        return data;
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }

  static delete({
    required String endPoint,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    log("Api-helper -> delete()");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("header -> $header");
    log("final url -> $url");
    try {
      var response = await http.delete(url, body: body, headers: header);
      log("ApiHelper -> Api Called -> status code=${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else {
        log("Else Condition -> Api failed");
        var decodedData = jsonDecode(response.body);
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }

  //for post
  static postRegisterData({
    required String endPoint,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    log("Api-helper>postRegisterData");
    log("$body");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("$url");
    try {
      var response = await http.post(url, body: body);
      log("ApiHelper>>Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else if (response.statusCode == 400) {
        var decodedData = jsonDecode(response.body);
        var data = {"status": 0, "msg": "RegisteredUser Already Exist", "data": decodedData};
        return data;
      } else {
        log("Else Condition -> Api failed");
        var decodedData = jsonDecode(response.body);
        var data = {"status": 0, "msg": "Failed", "data": decodedData};
        return data;
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }

  static postLike({
    required String endPoint,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    log("Api-helper -> postLike()");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("header -> $header");
    log("final url -> $url");
    try {
      var response = await http.post(url, body: body, headers: header);
      log("ApiHelper -> Api Called -> status code=${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else {
        log("Else Condition -> Api failed");
        var decodedData = jsonDecode(response.body);
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
