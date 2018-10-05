import 'dart:async';
import 'base.dart';

class AuthResponse {
  String _username;
  String _password;
  AuthResponse(this._username, this._password);

  AuthResponse.map(dynamic obj) {
    this._username = obj["username"];
    this._password = obj["password"];
  }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;

    return map;
  }
}

class AuthApi {
  ApiBase _api = new ApiBase();
  static const LOGIN_PATH = "/auth/login";

  Future<AuthResponse> login(String username, String password) {
    return _api.post(LOGIN_PATH, body: {
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return AuthResponse.map(res["user"]);
    });
  }
}
