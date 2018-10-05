import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'store/store.dart';
import 'store/appstate.dart';
import 'screens/login.dart';

void main() {
  final store = createStore();

  runApp(new KeycatApp(
    store: store,
  ));
}

class KeycatApp extends StatelessWidget {
  final Store<AppState> store;

  KeycatApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    return new StoreProvider<AppState>(
        // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
        // Widgets will find and use this value as the `Store`.
        store: store,
        child: new MaterialApp(
            theme: new ThemeData(fontFamily: 'SourceSansPro'),
            title: 'Keycat',
            home: LoginScreen()));
  }
}
