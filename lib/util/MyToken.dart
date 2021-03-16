import 'dart:convert';

import './MyStorage.dart';

class MyToken {
  token() async {
    var loginFuture = await MyStorage().getStorage('login');
    String loginString = loginFuture.toString();
    Map loginData = json.decode(loginString);
    String token = '${loginData["token_type"]} ${loginData["access_token"]}';
    return token;
  }
}
