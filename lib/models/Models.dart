import '../util/MyDio.dart';
import 'package:dio/dio.dart';
import '../util/MyStorage.dart';
import '../util/MyToken.dart';

class Models {
  lolAccount() async {
    String apiUrl = 'http://106.54.155.93:3000/lol-account';
    try {
      Dio dio = await MyDio().init();
      Response response = await dio.get(apiUrl);
      return response;
    } catch (err) {
      print(err);
      return false;
    }
  }

  // 登录成功后，信息存入storage
  login({String userEmail, String userPassword}) async {
    String apiUrl =
        'https://sd.codemao.cn/api/v2/auth/login?login=$userEmail&password=$userPassword';
    try {
      Dio dio = await MyDio().init();
      Response response = await dio.post(apiUrl);
      MyStorage().setStorage('login', response.toString());
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  user() async {
    String apiUrl = 'https://sd.codemao.cn/api/v2/user';
    try {
      Dio dio = await MyDio().init();
      var tokenFuture = await MyToken().token();
      Response response = await dio.get(apiUrl,
          options: Options(headers: {
            'Authorization': tokenFuture.toString(),
          }));
      MyStorage().setStorage('user', response.toString());
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }
}
