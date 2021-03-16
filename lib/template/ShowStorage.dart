import 'dart:convert';
import '../util/MyStorage.dart';
import 'package:flutter/material.dart';

class ShowStoragePage extends StatefulWidget {
  // arguments.storageName; needed;
  final Map arguments;
  ShowStoragePage({
    Key key,
    this.arguments,
  }) : super(key: key);

  @override
  _ShowStoragePageState createState() =>
      _ShowStoragePageState(arguments: this.arguments);
}

class _ShowStoragePageState extends State<ShowStoragePage> {
  List<Widget> list = [];
  final Map arguments;
  _ShowStoragePageState({this.arguments}) : super();
  @override
  void initState() {
    super.initState();
    initList();
  }

  initList() async {
    var dataFuture = await MyStorage().getStorage(arguments['storageName']);
    String dataString = dataFuture.toString();
    Map data = json.decode(dataString);
    List<Widget> renderList = [];
    data.forEach((key, value) {
      renderList.add(ListTile(
        title: Text(
          key.toString(),
          style: TextStyle(color: Colors.blue),
        ),
        subtitle: Text(
          value.toString(),
          style: TextStyle(color: Colors.red),
        ),
      ));
    });
    setState(() {
      list = renderList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(arguments['storageName']),
        ),
        body: ListView(
          children: list.length > 0 ? list : [Container()],
        ),
      ),
    );
  }
}
