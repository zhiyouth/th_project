import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../store/State.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        StoreConnector<ReduxState, String>(
          converter: (store) => store.state.toString(),
          builder: (context, count) {
            return new Text(
              count,
              style: Theme.of(context).textTheme.display1,
            );
          },
        )
      ],
    );
  }
}
