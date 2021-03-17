import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:th_project/models/Models.dart';

class LOLAccountPage extends StatefulWidget {
  LOLAccountPage({Key key}) : super(key: key);

  @override
  _LOLAccountPageState createState() => _LOLAccountPageState();
}

class _LOLAccountPageState extends State<LOLAccountPage> {
  List<Widget> accountWidgetList = [Container()];
  fetchLOLAccount() async {
    var resultList = await Models().lolAccount();
    return resultList;
  }

  renderListView() async {
    Response resultList = await fetchLOLAccount();
    print(resultList.data);
    print(resultList.data[0]['username']);
    List<Widget> renderList = [];
    resultList.data.forEach((item) {
      renderList.add(ListTile(
        title: Text('账号：' + item['username'].toString()),
        subtitle: Text('密码：' + item['password'].toString()),
      ));
    });
    // return resultList;
    setState(() {
      this.accountWidgetList = renderList;
    });
  }

  @override
  void initState() {
    super.initState();
    renderListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOL账号'),
      ),
      body: ListView(
        children: accountWidgetList,
      ),
    );
  }
}
