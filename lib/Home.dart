import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'store/State.dart';
import 'actions/Actions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TH_PROJECT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<ReduxState, String>(
              converter: (store) => store.state.toString(),
              builder: (context, count) {
                return Text(
                  count,
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/LoginPage');
              },
              child: Text('点击去登录页面'),
            )
          ],
        ),
      ),
      // Connect the Store to a FloatingActionButton. In this case, we'll
      // use the Store to build a callback that with dispatch an Increment
      // Action.
      //
      // Then, we'll pass this callback to the button's `onPressed` handler.
      floatingActionButton: StoreConnector<ReduxState, VoidCallback>(
        converter: (store) {
          // Return a `VoidCallback`, which is a fancy name for a function
          // with no parameters. It only dispatches an Increment action.
          return () => store.dispatch(ReduxActions.CHANGE_IS_DARK);
        },
        builder: (context, callback) {
          return FloatingActionButton(
            // Attach the `callback` to the `onPressed` attribute
            onPressed: callback,
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
