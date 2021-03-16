import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('忘记密码'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('账号'),
            subtitle: Text('tanghao'),
          ),
          ListTile(
            title: Text('密码'),
            subtitle: Text('tanghao'),
          ),
          ListTile(
            title: Text('性别'),
            subtitle: Text('男'),
          ),
        ],
      ),
    );
  }
}
