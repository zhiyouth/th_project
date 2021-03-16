import 'package:flutter/material.dart';
import '../models/Models.dart';

class LoginPage extends StatefulWidget {
  final Map arguments;
  LoginPage({Key key, this.arguments}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState(arguments: this.arguments);
}

class _LoginPageState extends State<LoginPage> {
  bool passwordObscure = true;
  TextEditingController defaultUserEmail =
      TextEditingController(text: 'tanghao@codemao.cn');
  TextEditingController defaultUserPassword =
      TextEditingController(text: 'RR6004rr');
  String userPassword = '';
  String userEmail = '';
  final Map arguments;
  _LoginPageState({this.arguments}) : super();

  login() async {
    String userEmailValue =
        defaultUserEmail.text != '' ? defaultUserEmail.text : userEmail;
    String passwordValue =
        defaultUserPassword.text != '' ? defaultUserPassword.text : userEmail;
    bool loginRes = await Models()
        .login(userEmail: userEmailValue, userPassword: passwordValue);
    if (loginRes) {
      print('登录成功');
      Navigator.pushReplacementNamed(context, '/TabsPage');
    } else {
      print('登录失败');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(title: Text('登录')),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 80, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '你好',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '欢迎来到先锋团',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: defaultUserEmail,
                onChanged: (value) {
                  this.userEmail = value;
                },
              ),
              TextField(
                obscureText: passwordObscure,
                controller: defaultUserPassword,
                onChanged: (value) {
                  this.userPassword = value;
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Image.asset(
                        'assets/images/user_password_${this.passwordObscure ? 'close' : 'open'}.jpg'),
                    onPressed: () {
                      setState(() {
                        this.passwordObscure = !this.passwordObscure;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Text(
                      '首次登录',
                      style: TextStyle(
                        color: Color.fromRGBO(233, 94, 91, 1),
                        fontSize: 12.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/FirstLoginPage');
                    },
                  ),
                  InkWell(
                    child: Text(
                      '忘记密码',
                      style: TextStyle(
                        color: Color.fromRGBO(233, 94, 91, 1),
                        fontSize: 12.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/ForgetPasswordPage',
                        arguments: {'aa': '111'},
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 45.0),
              Row(children: [
                Expanded(
                  child: RaisedButton(
                    color: Color.fromRGBO(233, 94, 91, 1),
                    child: Text('登录', style: TextStyle(color: Colors.white)),
                    onPressed: login,
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
