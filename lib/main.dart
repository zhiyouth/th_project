import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'store/State.dart';
import 'actions/Actions.dart';
import 'routes/Routes.dart';

ReduxState defaultConfig = ReduxState();
// One simple action: Increment

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
ReduxState counterReducer(state, dynamic action) {
  if (action == ReduxActions.TURN_TO_DARK) {
    state.setState({"isDark": true});
  }

  if (action == ReduxActions.CHANGE_IS_DARK) {
    if (state.isDark) {
      state.setState({
        "isDark": false,
      });
    } else {
      state.setState({
        "isDark": true,
      });
    }
  }
  return state;
}

void main() {
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final store = Store<ReduxState>(counterReducer, initialState: defaultConfig);

  runApp(FlutterReduxApp(
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<ReduxState> store;

  FlutterReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    return StoreProvider<ReduxState>(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: store,
      child: StoreConnector<ReduxState, bool>(
        converter: (store) => store.state.isDark,
        builder: (context, isDark) {
          return MaterialApp(
            theme: isDark
                ? ThemeData(
                    brightness: Brightness.dark,
                    floatingActionButtonTheme: FloatingActionButtonThemeData(
                        foregroundColor: Colors.grey),
                  )
                : ThemeData(
                    brightness: Brightness.light,
                    floatingActionButtonTheme: FloatingActionButtonThemeData(
                        foregroundColor: Colors.black),
                  ),
            // theme: StoreConnector<ReduxStore, bool>(
            //   converter: (store) => store.state.isDark,
            //   builder: (context, isDark) {
            //     return isDark ? ThemeData.dark() : ThemeData();
            //   },
            // ),
            initialRoute: '/',
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}
